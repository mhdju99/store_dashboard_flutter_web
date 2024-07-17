import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/pages/larg_screen.dart';
import 'package:store_dashbord/widgets/small_screen.dart';
import 'package:store_dashbord/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: T,
        key: scaffoldKey,
        appBar: topNavigationBar(context, scaffoldKey),
        backgroundColor: background,
        // drawer: const Drawer(),
        body: LargScreen());
    // ResponsiveWidget(
    //   largScreen: LargScreen(),
    //   smallScreen: const SmallScreen(),
    // ));
  }
}
