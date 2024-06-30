import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jomaat"),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Expanded(
              child: Container(
            color: Colors.green,
          )),
          Expanded(
              flex: 5,
              child: Container(
                color: Colors.blue,
              ))
        ],
      ),
    );
  }
}
