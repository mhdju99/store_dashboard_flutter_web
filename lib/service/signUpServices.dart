import 'package:dio/dio.dart';
import 'package:store_dashbord/helper/api.dart';

class SignUpServices {
  final Dio dio;
  SignUpServices({
    required this.dio,
  });
  Future<Response> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    dynamic Data = await Api()
        .post(endpoint: "https://api.escuelajs.co/api/v1/users/", body: {
      "name": name,
      "email": email,
      "password": password,
      "avatar": "https://api.lorem.space/image/face?w=640&h=480"
    });

    return Data;
  }
}
