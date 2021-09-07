import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hivecrud/api/ApiService.dart';
import 'package:hivecrud/api/entity/OriginEntity.dart';
import 'package:hivecrud/api/response/CharResponse.dart';

class RetrofitController extends GetxController {
//observed object
  var charObs = CharResponse(
    id: 0,
    name: '',
    status: '',
    species: '',
    type: '',
    gender: '',
    image: '',
    originEntity: OriginEntity(name: '', url: ''),
  ).obs;

  ApiService apiService = ApiService(
    Dio(),
  );

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    final response =
        await apiService.character().then((value) => charObs.value = value);
    print(response);
  }
}
