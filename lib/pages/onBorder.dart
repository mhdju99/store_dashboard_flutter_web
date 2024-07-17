import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/controllers/AuthenticationManager%20.dart';
import 'package:store_dashbord/pages/auth/logInPage.dart';
import 'package:store_dashbord/sitelayout.dart';


class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = Get.find();
    return Obx(() {
            print("kkkkkkkkk      ${authManager.isLogged.value}    kkkkkkkkk");

      return authManager.isLogged.value ? SiteLayout() : LogIn();
    });
  }
}
