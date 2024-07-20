// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:store_dashbord/controllers/brandController..dart';
import 'package:store_dashbord/controllers/categoryController.dart';
import 'package:store_dashbord/controllers/productController.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/pages/category/category.dart';
import 'package:store_dashbord/pages/overview/widget/card_larg.dart';
import 'package:store_dashbord/widgets/CustomTextField.dart';
import 'package:store_dashbord/widgets/alertDilog.dart';
import 'package:store_dashbord/widgets/customText.dart';
import 'package:store_dashbord/widgets/dropDown.dart';

class invoice extends StatelessWidget {
  invoice({super.key});
  final formkey = GlobalKey<FormState>();

  String? selectedValue;
  List<String?> ccs = ["d", "e"];
  // ProductController cc = Get.put(ProductController());
  // BrandController bb = Get.put(BrandController());
  // categoryController cat = Get.put(categoryController());


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
            text: "invoices",
            fontSize: 27,
            wight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 49,
        ),
        Container(
          color: Colors.grey.shade100,
          padding: EdgeInsets.symmetric(horizontal: width / 80),
          child: Row(
            children: [
              Expanded(
                  child: CustomText(
                text: "My invoices",
                fontSize: 22,
                wight: FontWeight.bold,
              )),
              IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
            ],
          ),
        ),

        Expanded(
          child: Container(
            
            padding: EdgeInsets.symmetric(horizontal: width / 80),
            child: GridView.builder(
                                padding: const EdgeInsets.only(top: 20),

                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2,
                    childAspectRatio: 1.6,
                    crossAxisCount:
                        ResponsiveWidget.isSmallScreen(context) ? 2 : 4),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    // Define the shape of the card
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 1.3,
                      ),
                    ),
                    // Define how the card's content should be clipped
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    // Define the child widget of the card
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Date :",
                                fontSize: 14,
                                coler: Colors.grey,
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              CustomText(
                                text: "2024 /3 /4",
                                wight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Number :",
                                fontSize: 14,
                                coler: Colors.grey,
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              CustomText(
                                text: "453435",
                                wight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "suplaier :",
                                fontSize: 14,
                                coler: Colors.grey,
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              CustomText(
                                text: "AL jumaat",
                                wight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Total =",
                                fontSize: 14,
                                coler: Colors.grey,
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              CustomText(
                                text: "3534 s.p",
                                wight: FontWeight.bold,
                                coler: Colors.orange.shade400,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Future<dynamic> product_info_dialog() {
    return Get.defaultDialog(
      title: "PRODUCT INFO",
      content: Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                    fit: BoxFit.fitWidth,
                    height: 170,
                    "https://m.media-amazon.com/images/I/813-n5YTYiL.__AC_SY445_SX342_QL70_ML2_.jpg"
                    // cc.Barnds[index].Image!,
                    ),
                cardDetails(
                  header: "NAME",
                  data: " hovo v7",
                ),
                cardDetails(
                  header: "Brand",
                  data: "sony",
                ),
                cardDetails(
                  header: "category",
                  data: "headphone",
                ),
                cardDetails(
                  header: "id",
                  data: "3459834985",
                ),
                cardDetails(
                  header: "descripton",
                  data: "dgrgretertrtert  ertertertertgdfgdgdgfdgdfg",
                ),
                const SizedBox(height: 50),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.back();
                    // Get.defaultDialog(
                    //     title: ' Alert',
                    //     middleText: 'Do you want to close?',
                    //     onConfirm: () {

                    //       // cc.del(listofitem[index].suplayerID!);
                    //     },
                    //     textConfirm: 'yes',
                    //     confirmTextColor: Colors.amberAccent,
                    //     textCancel: 'no');
                  },
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )),
                      side: WidgetStateProperty.all(BorderSide.none),
                      textStyle: WidgetStateProperty.all(
                          const TextStyle(color: Colors.white)),
                      backgroundColor: WidgetStateProperty.all(Colors.red)),
                  icon: const Icon(
                    // <-- Icon
                    Icons.delete,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Remove Suplayer',
                    style: TextStyle(color: Colors.white),
                  ), // <-- Text
                )
              ],
            ),
          ),
        ),
      ),
      onCancel: () {
        Get.back();
      },
      textCancel: "undo",
    );
  }
}
