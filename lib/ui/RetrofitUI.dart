import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hivecrud/controller/RetrofitController.dart';

class RetrofitUI extends StatelessWidget {
  const RetrofitUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restrofitController = Get.put(RestrofitController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrofit'),
        actions: [
          IconButton(
              onPressed: () => restrofitController.getData(),
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Card(
            child: ListTile(
              leading: Image.network(restrofitController.charObs.value.image),
              title: Text('${restrofitController.charObs.value.name}'),
              subtitle: Text('${restrofitController.charObs.value.status}'),
              trailing:
                  restrofitController.charObs.value.gender.toLowerCase() ==
                          'male'
                      ? Icon(Icons.male)
                      : Icon(Icons.female),
            ),
          ),
        ),
      ),
    );
  }
}
