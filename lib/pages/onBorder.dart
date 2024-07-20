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
    authManager.login(
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJoaGhoaG1vZDBAZ21haWwuY29tIiwidXNlcklkIjoiNjY5NWFiYmY3MmNlNDFmYTcwNjhkYTMyIiwiaWF0IjoxNzIxNDgzMjYxLCJleHAiOjE3MjE1Njk2NjF9.F7OhSv8zqNqpIsApsiy0XRhTrjMXwZLJr4hb19z_kc0");
    return Obx(() {
      print("kkkkkkkkk      ${authManager.isLogged.value}    kkkkkkkkk");

      return authManager.isLogged.value ? SiteLayout() : LogIn();
    });
  }
}
