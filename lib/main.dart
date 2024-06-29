import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/sitelayout.dart';
// ssdgg
void main() {
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
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.blue,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          })),
      home: const SiteLayout(),
    );
  }
}
