import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hivecrud/controller/RetrofitController.dart';

class RetrofitUI extends StatelessWidget {
  const RetrofitUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final retrofitController = Get.put(RetrofitController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrofit'),
        actions: [
          IconButton(
              onPressed: () => retrofitController.getData(),
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Obx(
        () => retrofitController.charObs.value.name.isEmpty
            ? Center(child: CupertinoActivityIndicator())
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Card(
                  child: ListTile(
                    leading:
                        Image.network(retrofitController.charObs.value.image),
                    title: Text('${retrofitController.charObs.value.name}'),
                    subtitle:
                        Text('${retrofitController.charObs.value.status}'),
                    trailing:
                        retrofitController.charObs.value.gender.toLowerCase() ==
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
