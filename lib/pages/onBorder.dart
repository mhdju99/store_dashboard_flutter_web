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
    authManager.login("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyRW1haWwiOiJoaGhoaG1vZDBAZ21haWwuY29tIiwidXNlcklkIjoiNjY5ZDgzNjc1ZDVmOGQ0YTMwM2Q0MTlkIiwiaWF0IjoxNzIxOTQwNjAxLCJleHAiOjE3MjIwMjcwMDF9.HkRDo000-c0QMb1AZoN6Tut7AjVK1HFeyrvhfVPr1rI");
    return Obx(() {
      print("kkkkkkkkk      ${authManager.isLogged.value}    kkkkkkkkk");

      return authManager.isLogged.value ? SiteLayout() : LogIn();
    });
  }
}
