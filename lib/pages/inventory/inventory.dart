// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/controllers/inventoryController.dart';

import 'package:store_dashbord/controllers/suplayerController.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/model/suplayer_model.dart';
import 'package:store_dashbord/pages/overview/widget/card_larg.dart';
import 'package:store_dashbord/widgets/CustomTextField.dart';
import 'package:store_dashbord/widgets/alertDilog.dart';
import 'package:store_dashbord/widgets/customText.dart';

class inventory extends StatelessWidget {
  inventory({super.key});
  final formkey = GlobalKey<FormState>();
  void dispose() {
    Get.delete<inventoryController>();
  }
  @override
  Widget build(BuildContext context) {
      inventoryController cc = Get.find<inventoryController>();
        // inventoryController cc = Get.put(inventoryController(),permanent: F);


    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 50,),
        Padding(
          padding: EdgeInsets.only(top: 20, left: width / 100),
          child: CustomText(
            text: "inventory management",
            fontSize: 27,
            wight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        Container(
          color: Colors.amber.shade50,
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: TabBar(
                    controller: cc.controller,
                    
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CN2,
                    ),
                    tabs: const [
                      Tab(
                        text: "inventory",
                      ),
                      Tab(
                        text: "inventory low",
                      ),
                    ]),
              ),
              const Expanded(
                child: SizedBox(
                  width: 10,
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
            ],
          ),
        ),
      ],
    );
  }
}

class tabel extends StatelessWidget {
  // suplayerController cc = Get.put(suplayerController());

  // List<SuplayerData> listofitem = [];
  tabel({
    Key? key,
    // required this.listofitem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("DSfsd")
      ),
    );
  }
}

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
