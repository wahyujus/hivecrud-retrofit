import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hivecrud/model/transaction.dart';
import 'package:hivecrud/controller/Boxes.dart';

class HomeController extends GetxController {
  var isPengeluaran = false.obs;
  var isPendapatan = false.obs;
  var isExpense = false.obs;

  //tab
  var indexTab = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> addTransaction(
      String name, String amount, bool isExpense) async {
    var isBool = true;

    final transaction = Transaction()
      ..name = name
      ..createdDate = DateTime.now()
      ..amount = double.parse(amount)
      ..isExpense = isExpense;

    final box = Boxes.getTransactions();
    box.add(transaction);

    Get.back();
    Get.snackbar('$name', '\$$amount',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: !isExpense ? Colors.green : Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        isDismissible: true,
        icon: Icon(
          Icons.redo,
          color: Colors.white,
        ), onTap: (val) {
      if (isBool == true) {
        //spam handling
        deleteTransaction(transaction);
        isBool = false;
      }
    });
  }

  Future<void> editTransaction(
    Transaction transaction,
    String name,
    double amount,
    bool isExpense,
  ) async {
    transaction.name = name;
    transaction.amount = amount;
    transaction.isExpense = isExpense;

    transaction.save();
  }

  void deleteTransaction(Transaction transaction) {
    var isBool = true;

    transaction.delete();
    Get.snackbar('${transaction.name}', '\$${transaction.amount}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: !transaction.isExpense ? Colors.green : Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        isDismissible: true,
        icon: Icon(
          Icons.redo,
          color: Colors.white,
        ), onTap: (val) {
      var hiveTransaction = Transaction();
      hiveTransaction = transaction;

      final box = Boxes.getTransactions();

      if (isBool == true) {
        //error handling
        box.add(hiveTransaction);
        isBool = false;
      }
    });
  }
}
