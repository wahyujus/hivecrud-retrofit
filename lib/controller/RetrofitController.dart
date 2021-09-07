import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hivecrud/api/ApiService.dart';
import 'package:hivecrud/api/entity/OriginEntity.dart';
import 'package:hivecrud/api/response/CharResponse.dart';
import 'package:hivecrud/api/response/CharacterListResponse.dart';

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

  var characters = CharacterListResponse().obs;

  ApiService apiService = ApiService(
    Dio(),
  );

  @override
  void onInit() {
    super.onInit();
    getDataList();
  }

  Future<void> getData(String id) async {
    final response =
        await apiService.character(id).then((value) => charObs.value = value);
    print(response);
  }

  Future<void> getDataList() async {
    final response = await apiService
        .charactersList()
        .then((value) => characters.value = value);
    print(response);
  }
}
