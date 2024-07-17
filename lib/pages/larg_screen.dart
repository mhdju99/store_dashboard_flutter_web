import 'package:animated_sidebar/animated_sidebar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/controllers/NavigationRailController.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/pages/brands/brands.dart';
import 'package:store_dashbord/pages/category/category.dart';
import 'package:store_dashbord/pages/overview/overview.dart';
import 'package:store_dashbord/pages/overview/page2.dart';
import 'package:store_dashbord/pages/products/products.dart';
import 'package:store_dashbord/pages/suplayer/suplayer.dart';

class LargScreen extends StatelessWidget {
  LargScreen({super.key});
  NavigationRailController cc = Get.put(NavigationRailController());
  List<SidebarItem> navigationDestinations = [
    SidebarItem(
      icon: Icons.trending_up,
      text: 'Overview',
    ),
    SidebarItem(
      icon: Icons.settings,
      text: 'Settings',
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
    // Add more destinations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Obx(() => !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                // GetX<NavigationRailController>(builder: (cc) {
                //   return Expanded(
                //     child: NavigationRail(
                //       selectedIndex: cc.activeIndex.value,
                //       onDestinationSelected: (int index) {
                //         cc.changeActivePage(index);
                //       },
                //       destinations: navigationDestinations,
                //     ),
                //   );
                // }),
                SizedBox(
                  child: AnimatedSidebar(
                    margin: const EdgeInsets.fromLTRB(10, 15, 5, 15),
                    expanded: ResponsiveWidget.isLargScreen(context),
                    items: navigationDestinations,
                    // use this to set the active tab if you want to control it from outside
                    // combined with autoSelectedIndex set to false
                    // if you don't set autoSelectedIndex to false, the widget will
                    // automatically set the active tab and selected item is used only
                    // to set the initial value
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
                        colors: [
                          light, light, light
                          // Color.fromRGBO(66, 66, 74, 1),
                          // Color.fromRGBO(25, 25, 25, 1),
                        ],
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
                  child: IndexedStack(
                    index: cc.activeIndex.value,
                    children: [
                      const Overview(),
                      const page2(),
                       products(),
                      brands(),
                      const category(),
                      suplayer(),
                    ],
                  ),
                )
              ],
            )
          : IndexedStack(
              index: cc.activeIndex.value,
              children: [
                const Overview(),
                const page2(),
                 products(),
                brands(),
                const category(),
                suplayer(),
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