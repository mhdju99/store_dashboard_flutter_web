import 'package:dio/dio.dart';
import 'package:store_dashbord/constants/end_points.dart';
import 'package:store_dashbord/helper/api.dart';

class LogInServices {
  final Dio dio;
  LogInServices({
    required this.dio,
  });
  Future<Response?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      Response? data = await Api().post(endpoint: EndPoints.login_endpoint, body: {
        "email": email,
        "password": password,
      });
      return data;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
