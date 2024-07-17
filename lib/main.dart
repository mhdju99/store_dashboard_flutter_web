import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/pages/splashScreen.dart';
import 'package:store_dashbord/sitelayout.dart';

void main() async {
  await GetStorage.init();

  // Get.put(MenuController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "dashbord",
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        primaryColor: Colors.blue,
        fontFamily: "Metropolis",
      ),
      home:
          //  SiteLayout(),

          SplashView(),
    );
  }
}
