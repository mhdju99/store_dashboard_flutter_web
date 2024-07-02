import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_dashbord/constants/assets.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/widgets/customText.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0),
          ),
        ),
        iconTheme: IconThemeData(
          color: dark,
        ),
        // leading: ResponsiveWidget.isSmallScreen(context)
        //     ? IconButton(
        //         onPressed: () {
        //           key.currentState!.openDrawer();
        //         },
        //         icon: const Icon(Icons.menu))
        //     : Row(
        //         children: [
        //           Container(
        //             padding: const EdgeInsets.all(14),
        //             child: Image.asset("assets/icons/logoo.png"),
        //           )
        //         ],
        //       ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: dark.withOpacity(.7),
              )),
          Stack(children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications, color: dark.withOpacity(.7))),
            Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: active,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: light, width: 2)),
                ))
          ]),
          VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 15,
            endIndent: 15,
            color: lightGrey,
          ),
          const SizedBox(
            width: 15,
          ),
          CustomText(
            text: "Muhhamed Aljumaat",
            fontSize: 14,
            coler: lightGrey,
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          const SizedBox(
            width: 40,
          )
        ],
        // title: Row(
        //   children: [
        //     CustomText(
        //       text: "Dash",
        //       coler: lightGrey,
        //       wight: FontWeight.bold,
        //     ),
        //     Expanded(child: Container())
        //   ],
        // ),
        surfaceTintColor: dark,
        backgroundColor: Colors.transparent);
