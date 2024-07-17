import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/controllers/AuthenticationManager%20.dart';
import 'package:store_dashbord/model/Login_Respons_Model.dart';
import 'package:store_dashbord/pages/onBorder.dart';
import 'package:store_dashbord/service/logInService.dart';
import 'package:store_dashbord/service/signUpServices.dart';

class AuthController extends GetxController {
  late AuthenticationManager _authManager;
  RxBool isLoading = false.obs;
  String? email, password, name;
  @override
  void onInit() {
    super.onInit();
    _authManager = Get.find();
  }

  validateEmail(String? Email) {
    if (!GetUtils.isEmail(Email ?? "")) {
      return "email not correct";
    } else {
      return null;
    }
  }

  validatePassword(String? pwd) {
    if (GetUtils.isLengthLessThan(pwd ?? "", 2)) {
      return "password must be 8 char ";
    } else {
      return null;
    }
  }

  signUp() async {
    var result = await SignUpServices(
      dio: Dio(),
    ).signUp(
        name: name.toString(),
        email: email.toString(),
        password: password.toString());
    isLoading.value = false;
    if (result.statusCode == 200 || result.statusCode == 201) {
      Get.snackbar("success", "success");
      Get.offAll(const OnBoard());
    } else {
      Get.snackbar(
          result.statusCode.toString(), result.statusMessage.toString());
    }
  }

  login() async {
    var result = await LogInServices(
      dio: Dio(),
    ).logIn(email: email.toString(), password: password.toString());
    isLoading.value = false;
    if (result!.statusCode == 200 || result.statusCode == 201) {
      LoginResponsModel loginres = LoginResponsModel.fromJson(result.data);
      _authManager.login(loginres.token);
    } else {
      Get.snackbar(
          result.statusCode.toString(), result.statusMessage.toString());
    }
  }
}
