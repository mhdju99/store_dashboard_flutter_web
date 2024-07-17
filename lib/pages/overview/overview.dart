import 'package:flutter/material.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/pages/overview/widget/card_larg.dart';
import 'package:store_dashbord/widgets/customText.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 50,),
        Padding(
          padding: EdgeInsets.only(top: 20, left: width / 100),
          child: CustomText(
            text: "Overview",
            fontSize: 27,
            wight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: !ResponsiveWidget.isSmallScreen(context)
              ? largc(width: width)
              : smallc(width: width),
        )
      ],
    );
  }
}

class largc extends StatelessWidget {
  const largc({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      // scrollDirection: Axis.horizontal,
      children: [
        // const CardLarg(),
        // SizedBox(
        //   width: width / 65,
        // ),
        // const CardLarg(),
        // SizedBox(
        //   width: width / 65,
        // ),
        // const CardLarg(),
        // SizedBox(
        //   width: width / 65,
        // ),
        // const CardLarg(),
        // SizedBox(
        //   width: width / 65,
        // )
      ],
    );
  }
}

class smallc extends StatelessWidget {
  const smallc({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   children: [
        //     const CardLarg(),
        //     SizedBox(
        //       width: width / 60,
        //     ),
        //     const CardLarg(),
        //     SizedBox(
        //       width: width / 60,
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 20,
        // ),
        // Row(
        //   children: [
        //     const CardLarg(),
        //     SizedBox(
        //       width: width / 60,
        //     ),
        //     const CardLarg(),
        //     SizedBox(
        //       width: width / 60,
        //     ),
        //   ],
        // )
      ],
    );
  }
//     Row(
//       // scrollDirection: Axis.horizontal,
//       children: [
//         const CardLarg(),
//         SizedBox(
//           width: width / 60,
//         ),
//         const CardLarg(),
//         SizedBox(
//           width: width / 60,
//         ),
//         const CardLarg(),
//         SizedBox(
//           width: width / 60,
//         ),
//         const CardLarg(),
//         SizedBox(
//           width: width / 60,
//         )
//       ],
//     );
//   }
// }
}
