import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/pages/overview/overview.dart';
import 'package:store_dashbord/routing/routes.dart';

class NavigationRailController extends GetxController {
  static MenuController instance = Get.find();
  var activeIndex = 0.obs;
  var currentpage = Overview();
  changeActivePage(int index) {
    activeIndex.value = index;
  }


  // Widget returnIconFor(String item) {
  //   switch (item) {
  //     case overViewPageRoute:
  //       return _customIcon(Icons.trending_up, item);
  //     case productsPageRoute:
  //       return _customIcon(Icons.production_quantity_limits, item);
  //     case supplayerPageRoute:
  //       return _customIcon(Icons.trending_up, item);
  //     case ordersPageRoute:
  //       return _customIcon(Icons.trending_up, item);
  //     case customarPageRoute:
  //       return _customIcon(Icons.trending_up, item);
  //     default:
  //       return _customIcon(Icons.trending_up, item);
  //   }
  }


