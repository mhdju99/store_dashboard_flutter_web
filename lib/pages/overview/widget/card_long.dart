// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store_dashbord/constants/style.dart';

class card_long extends StatelessWidget {
  double p;
  Widget chaild;
  card_long({
    Key? key,
    required this.p,
    required this.chaild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: MediaQuery.of(context).size.height * p,
        width: 400,

        // padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(66, 66, 66, 0.75),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
          // boxShadow: [
          //   BoxShadow(
          //     offset: const Offset(0, 5),
          //     spreadRadius: 0,
          //     blurRadius: 10,
          //     color: Colors.black.withOpacity(0.6),
          //   ),
          // ],
          borderRadius: BorderRadius.circular(10),
          // gradient: const LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [
          //     Color(0xFF846AFF),
          //     Color(0xFF755EE8),
          //     Colors.purpleAccent,
          //     Colors.amber,
          //   ],
        ),
        child: chaild,
      ), // Adds a gradient background and rounded corners to the container
    );
  }
}
