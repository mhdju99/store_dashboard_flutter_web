// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:store_dashbord/constants/style.dart';
// import 'package:store_dashbord/routing/routes.dart';

// class MenuController extends GetxController {
//   static MenuController instance = Get.find();
//   var activeItem = overViewPageRoute.obs;
//   var hoverItem = "".obs;
//   changeActivePage(String itemName) {
//     activeItem.value = itemName;
//   }

//   // onHover(String itemName) {
//   //   if (!isActive(itemName)) hoverItem.value = itemName;
//   // }

//   // isActive(String itemName) => activeItem.value == itemName;

//   // ishovering(String itemName) => hoverItem.value == itemName;

//   // Widget returnIconFor(String item) {
//   //   switch (item) {
//   //     case overViewPageRoute:
//   //       return _customIcon(Icons.trending_up, item);
//   //       case productsPageRoute:
//   //       return _customIcon(Icons.production_quantity_limits, item);
//   //       case supplayerPageRoute:
//   //       return _customIcon(Icons.trending_up, item);
//   //       case ordersPageRoute:
//   //       return _customIcon(Icons.trending_up, item);
//   //           case customarPageRoute:
//   //       return _customIcon(Icons.trending_up, item);
//   //     default:
//   //      return _customIcon(Icons.trending_up, item);
//   //   }
//   // }

//   // Widget _customIcon(IconData icon, String item) {
//   //   if (isActive(item))
//   //     return Icon(
//   //       icon,
//   //       size: 22,
//   //       color: dark,
//   //     );
//   //   return Icon(
//   //     icon,
//   //     color: ishovering(item) ? dark : lightGrey,
//   //   );
//   // }
// }
