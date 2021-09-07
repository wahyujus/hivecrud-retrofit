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
          // IconButton(
          //     onPressed: () => retrofitController.getData(),
          //     icon: Icon(Icons.refresh))
        ],
      ),
      body: Obx(
        () => retrofitController.characters.value.results == null
            ? Center(child: CupertinoActivityIndicator())
            : ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  var listItem =
                      retrofitController.characters.value.results![index];
                  return ListTile(
                    leading: Image.network(listItem.image),
                    title: Text('${listItem.name}'),
                    subtitle: Text('${listItem.species}'),
                    trailing: listItem.gender.toLowerCase() == 'male'
                        ? Icon(Icons.male)
                        : Icon(Icons.female),
                  );
                },
              ),
      ),
    );
  }
}
