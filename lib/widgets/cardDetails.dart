import 'package:flutter/material.dart';
import 'package:store_dashbord/widgets/customText.dart';

class cardDetails extends StatelessWidget {
  String header;
  String data;

  cardDetails({
    Key? key,
    required this.header,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "$header :",
              wight: FontWeight.bold,
              coler: Colors.grey,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: CustomText(
                    maxline: 5,
                    text: data,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
