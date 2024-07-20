// import 'package:cubex_ecommerce/pages/logInPage.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/pages/invoice/invoice.dart';
import 'package:store_dashbord/pages/overview/page2.dart';

class AppRoute {
  static const homePageUrl = "/home";
  static const loginPageUrl = "/login-page";
  static const invocePageUrl = "/invoice";
  static const page2PageUrl = "/page2";

  static List<GetPage> pages = [
    // GetPage(name: homePageUrl, page: () => HomePage())
    GetPage(name: invocePageUrl, page: () => invoice()),
    GetPage(name: page2PageUrl, page: () => page2())
  ];
}
