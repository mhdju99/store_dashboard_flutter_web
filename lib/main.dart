import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/sitelayout.dart';

void main() {
  Get.put(MenuController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(360, 690),
      //   minTextAdapt: true,
      //   splitScreenMode: true,
      builder: (_, chaild) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "dashbord",
          darkTheme: ThemeData.dark(),
          theme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: light,
              primaryColor: Colors.blue,
              pageTransitionsTheme: const PageTransitionsTheme(builders: {
                TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              })),
          home: SiteLayout(),
        );
      }
    );
  }
}
