import 'package:dio/dio.dart';
import 'package:hivecrud/api/response/CharResponse.dart';
import 'package:hivecrud/api/response/CharacterListResponse.dart';
import 'package:retrofit/retrofit.dart';

part 'ApiService.g.dart';

//build runner script
//flutter pub run build_runner build
//flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: 'https://rickandmortyapi.com/api/')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
    );
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('character/{id}')
  Future<CharResponse> character(@Path() String id);

  @GET('character')
  Future<CharacterListResponse> charactersList();
}
