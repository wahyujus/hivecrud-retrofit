import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivecrud/controller/Boxes.dart';
import 'package:hivecrud/controller/HomeController.dart';
import 'package:hivecrud/model/transaction.dart';

class HiveUI extends StatefulWidget {
  const HiveUI({Key? key}) : super(key: key);

  @override
  _HiveUIState createState() => _HiveUIState();
}

class _HiveUIState extends State<HiveUI> {
  final homeController = Get.put(HomeController());
  TextEditingController? nameController = TextEditingController();
  TextEditingController? amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  void resetData() {
    homeController.isPengeluaran.value = false;
    homeController.isPendapatan.value = false;
    nameController!.text = '';
    amountController!.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Crud 😳'),
      ),
      body: ValueListenableBuilder<Box<Transaction>>(
        valueListenable: Boxes.getTransactions().listenable(),
        builder: (context, box, _) {
          final transactions = box.values.toList().cast<Transaction>();

          return buildContent(transactions);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          resetData();
          Get.bottomSheet(
            bottomSheet(),
            isScrollControlled: true,
          );
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }

  Widget buildContent(List<Transaction> transactions) {
    if (transactions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('no items yet!'.toUpperCase()),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.category_rounded,
              size: 100,
              color: Colors.grey[400],
            ),
          ],
        ),
      );
    } else {
      final netExpense = transactions.fold<double>(
        0,
        (previousValue, transaction) => transaction.isExpense
            ? previousValue - transaction.amount
            : previousValue + transaction.amount,
      );
      final newExpenseString = '\$${netExpense.toStringAsFixed(2)}';
      final color = netExpense > 0 ? Colors.green : Colors.red;

      return Column(
        children: [
          SizedBox(height: 24),
          Text(
            'Total Expense: $newExpenseString',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: color,
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = transactions[index];

                return Card(
                  child: ListTile(
                    title: Text(transaction.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        !transaction.isExpense
                            ? Text(
                                '+\$${transaction.amount.toStringAsFixed(2)}',
                                style: TextStyle(color: Colors.green),
                              )
                            : Text(
                                '-\$${transaction.amount.toStringAsFixed(2)}',
                                style: TextStyle(color: Colors.red),
                              ),
                        IconButton(
                          onPressed: () {
                            Get.bottomSheet(
                              editSheet(transaction, transaction.name,
                                  transaction.amount, transaction.isExpense),
                              isScrollControlled: true,
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            homeController.deleteTransaction(transaction);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }

  Widget bottomSheet() {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'add',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  hintText: "Masukkan Nama",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  hintText: "Masukkan Harga",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoSwitch(
                      value: homeController.isPengeluaran.value,
                      onChanged: (val) {
                        homeController.isPengeluaran.value = val;
                        if (homeController.isPendapatan.value == true) {
                          homeController.isPendapatan.value = false;
                        }
                      }),
                  Text(
                    'Pengeluaran'.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoSwitch(
                      value: homeController.isPendapatan.value,
                      onChanged: (val) {
                        homeController.isPendapatan.value = val;
                        if (homeController.isPengeluaran.value == true) {
                          homeController.isPengeluaran.value = false;
                        }
                      }),
                  Text(
                    'Pendapatan'.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: () {
                          var isExpense =
                              homeController.isPengeluaran.value ? true : false;
                          homeController.addTransaction(nameController!.text,
                              amountController!.text, isExpense);
                        },
                        child: Text('Submit'))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget editSheet(
    Transaction transaction,
    String name,
    double amount,
    bool isExpense,
  ) {
    nameController!.text = name;
    amountController!.text = '$amount';
    if (isExpense == true) {
      homeController.isPengeluaran.value = true;
      homeController.isPendapatan.value = false;
    } else {
      homeController.isPengeluaran.value = false;
      homeController.isPendapatan.value = true;
    }

    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'edit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  hintText: "Masukkan Nama",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  hintText: "Masukkan Harga",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoSwitch(
                      value: homeController.isPengeluaran.value,
                      onChanged: (val) {
                        homeController.isPengeluaran.value = val;
                        if (homeController.isPendapatan.value == true) {
                          homeController.isPendapatan.value = false;
                        }
                      }),
                  Text(
                    'Pengeluaran'.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoSwitch(
                      value: homeController.isPendapatan.value,
                      onChanged: (val) {
                        homeController.isPendapatan.value = val;
                        if (homeController.isPengeluaran.value == true) {
                          homeController.isPengeluaran.value = false;
                        }
                      }),
                  Text(
                    'Pendapatan'.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: () {
                          var isExpense =
                              homeController.isPengeluaran.value ? true : false;

                          homeController
                              .editTransaction(
                                  transaction,
                                  nameController!.text,
                                  double.parse(amountController!.text),
                                  isExpense)
                              .then((value) => Get.back());
                        },
                        child: Text('Submit'))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
