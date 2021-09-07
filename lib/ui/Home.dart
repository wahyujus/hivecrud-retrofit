import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hivecrud/controller/HomeController.dart';
import 'package:hivecrud/controller/RetrofitController.dart';
import 'package:hivecrud/ui/HiveUI.dart';
import 'package:hivecrud/ui/RetrofitUI.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final retrofitController = Get.put(RetrofitController());

    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: homeController.indexTab.value,
          children: [
            HiveUI(),
            RetrofitUI(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: homeController.indexTab.value,
          items: [
            BottomNavigationBarItem(
                label: 'Hive', icon: Icon(Icons.data_saver_off_rounded)),
            BottomNavigationBarItem(
                label: 'RetroFit', icon: Icon(Icons.network_wifi)),
          ],
          onTap: (val) async {
            print(val);
            homeController.indexTab.value = val;

            if (val == 1) {
              // await retrofitController.getData();
            }
          },
        ),
      ),
    );
  }
}
