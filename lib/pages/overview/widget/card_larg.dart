// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store_dashbord/constants/style.dart';

class CardLarg extends StatelessWidget {
  Color color;
  CardLarg({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        width: 260,

        // padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(66, 66, 66, 0.75),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
          //
          // [
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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total sails',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text('14',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.white)) // Adds a price to the bottom of the card
          ],
        ),
      ), // Adds a gradient background and rounded corners to the container
    );
  }
}
