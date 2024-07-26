import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/pages/overview/page2.dart';

class NavigationRailController extends GetxController {
  PageController pc = PageController();
  static MenuController instance = Get.find();
  var activeIndex = 0.obs;
  var currentpage = Overview();
  changeActivePage(int index) {
    activeIndex.value = index;
    pc.jumpToPage(index);
    onInit() {
      // Get.lazyPut(() => BrandController());
      // Get.lazyPut(()=> inventoryController());
    }
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
