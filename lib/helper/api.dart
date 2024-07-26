import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get_storage/get_storage.dart';
import 'package:store_dashbord/controllers/AuthenticationManager%20.dart';

class Api {
  AuthenticationManager cc = g.Get.find();
  final _dios = Dio(BaseOptions());

  Api() {
    // _dio.options.baseUrl = "http://localhost:8080/api/v1/";
    final String? token = cc.getToken();
    if (token != null) {
      _dios.options.headers = {"Authorization": "Bearer $token"};
    }
  }

  Future<Response?> get({required String endpoint}) async {
    try {
      // Map<String, dynamic> headers = {};

      Response response = await _dios.get(endpoint,
          options: Options(
              // contentType: Headers.jsonContentType,
              // responseType: ResponseType.json,
              )
          // queryParameters: headers,
          );

      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }

  Future<Response?> post({
    required String endpoint,
    required var body,
    String? token,
  }) async {
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    try {
      Response response = await _dios.post(endpoint,
          data: body,
          options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }

  Future<dynamic> put({
    required String endpoint,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    try {
      // Map<String, dynamic> headers = {};
      // headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
      // if (token != null) {
      //   headers.addAll({"Authorization": "Bearer $token"});
      // }
      Response response = await _dios.put(
        endpoint,
        data: body,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Error with status code = ${response.statusCode} ");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response?> del({
    required String endpoint,
  }) async {
    try {
      Response response = await _dios.delete(endpoint,
          options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));

      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
