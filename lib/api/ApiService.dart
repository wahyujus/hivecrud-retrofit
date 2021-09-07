import 'package:dio/dio.dart';
import 'package:hivecrud/api/response/CharResponse.dart';
import 'package:retrofit/retrofit.dart';

part 'ApiService.g.dart';

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

  @GET('character/2')
  Future<CharResponse> character();
}
