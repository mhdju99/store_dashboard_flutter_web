import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

const int largScreenSize = 1000;
const int mediumScreenSize = 600;
const int smallScreenSize = 360;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  final Widget largScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? customScreen;
  const ResponsiveWidget({
    super.key,
    required this.largScreen,
    this.mediumScreen,
    this.smallScreen,
    this.customScreen,
  });
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenSize;

  static bool isLargScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largScreenSize;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= smallScreenSize &&
      MediaQuery.of(context).size.width <= largScreenSize;

  static bool isCustomScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= smallScreenSize &&
      MediaQuery.of(context).size.width <= customScreenSize;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        if (width >= largScreenSize) {
          return largScreen;
        } else if (width < largScreenSize && width >= mediumScreenSize) {
          return mediumScreen ?? largScreen;
        } else {
          return smallScreen ?? largScreen;
        }
      },
    );
  }
}
