import 'package:animated_sidebar/animated_sidebar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/controllers/NavigationRailController.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/pages/Order/order.dart';
import 'package:store_dashbord/pages/brands/brands.dart';
import 'package:store_dashbord/pages/category/category.dart';
import 'package:store_dashbord/pages/inventory/inventory.dart';
import 'package:store_dashbord/pages/invoice/invoice.dart';
import 'package:store_dashbord/pages/overview/overview.dart';
import 'package:store_dashbord/pages/overview/page2.dart';
import 'package:store_dashbord/pages/products/products.dart';
import 'package:store_dashbord/pages/suplayer/suplayer.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

class LargScreen extends StatelessWidget {
  LargScreen({super.key});
  NavigationRailController cc = Get.put(NavigationRailController());
  List<SidebarItem> navigationDestinations = [
    // SidebarItem(
    //   icon: Icons.trending_up,
    //   text: 'Overview',
    // ),
    SidebarItem(
      icon: Icons.settings,
      text: 'Overview',
    ),
    SidebarItem(
      icon: Icons.laptop,
      text: 'products',
    ),
    SidebarItem(
      icon: Icons.bedroom_parent_outlined,
      text: 'brands',
    ),
    SidebarItem(
      icon: Icons.category_outlined,
      text: 'category',
    ),
    SidebarItem(
      icon: Icons.local_shipping_outlined,
      text: 'suplayer',
    ),
    SidebarItem(
      icon: Icons.currency_bitcoin_sharp,
      text: 'invoice',
    ),
    SidebarItem(
      icon: Icons.shopping_cart_outlined,
      text: 'orders',
    ),
    SidebarItem(
      icon: Icons.receipt_outlined,
      text: 'inventory',
    ),
    // Add more destinations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Obx(() => !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                SizedBox(
                  child: AnimatedSidebar(
                    margin: const EdgeInsets.fromLTRB(10, 15, 5, 15),
                    expanded: ResponsiveWidget.isLargScreen(context),
                    items: navigationDestinations,

                    selectedIndex: cc.activeIndex.value,
                    autoSelectedIndex: false,
                    onItemSelected: (int index) {
                      cc.changeActivePage(index);
                    },
                    duration: const Duration(milliseconds: 200),
                    frameDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.repeated,
                        colors: [light, light, light],
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(66, 66, 66, 0.75),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    minSize: 90,
                    maxSize: 200,
                    itemIconSize: 26,
                    itemIconColor: dark,
                    itemHoverColor: Colors.grey.withOpacity(0.3),
                    itemSelectedColor: CN3,

                    //  Colors.grey.withOpacity(0.3),
                    itemTextStyle: TextStyle(color: dark, fontSize: 20),
                    itemSelectedBorder: const BorderRadius.all(
                      Radius.circular(5),
                    ),

                    itemMargin: 16,
                    itemSpaceBetween: 10,
                    headerIcon: Icons.control_camera_sharp,
                    headerIconSize: 30,
                    headerIconColor: CN3,
                    headerTextStyle: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600, color: dark),
                    headerText: ' Dash',
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: PageView(
                    controller: cc.pc,
                    children: [
                      // const Overview(),
                      const Overview(),
                      products(),
                      brands(),
                      category(),
                      suplayer(),
                      invoice(),
                      Order(),
                      inventory()
                    ],
                  ),
                )
              ],
            )
          : PageView(
              controller: cc.pc,
              children: [
                // const Overview(),
                const Overview(),
                products(),
                brands(),
                category(),
                suplayer(),
                invoice(),
                Order(),

                inventory()
              ],
            )),
    );
  }
}
// NavigationRail(
//                     elevation: 3,
//                 backgroundColor: lightGrey,
//                 // labelType: NavigationRailLabelType.none,
//                 minExtendedWidth: 100,
//                 minWidth: 100,
//                 extended: ResponsiveWidget.isLargScreen(context),
//                 selectedIndex: cc.activeIndex.value,
//                 // useIndicator: true,

//                 selectedIconTheme:
//                     const IconThemeData(size: 22, color: Colors.grey),
//                 selectedLabelTextStyle:
//                     const TextStyle(fontWeight: FontWeight.bold),
//                 leading: const SizedBox(
//                   height: 100,
//                 ),
//                 onDestinationSelected: (int index) {
//                   cc.changeActivePage(index);
//                 },
//                 destinations: navigationDestinations,
//               )
