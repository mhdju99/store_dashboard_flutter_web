// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/controllers/invoiceController.dart';
import 'package:store_dashbord/controllers/productController.dart';
import 'package:store_dashbord/controllers/suplayerController.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/model/invoice_data.dart';
import 'package:store_dashbord/pages/category/category.dart';
import 'package:store_dashbord/pages/products/products.dart';
import 'package:store_dashbord/widgets/customText.dart';

class invoice extends StatelessWidget {
  invoice({super.key});
  invoiceController cc = Get.put(invoiceController());
  suplayerController ss = Get.put(suplayerController());
  ProductController pp = Get.put(ProductController());

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
              IconButton(
                  onPressed: () {
                    cc.refresh();
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ),

        Obx(() {
          if (!cc.loading.value) {
            return cc.invoices.isNotEmpty
                ? Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width / 80),
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 20),
                          itemCount: cc.invoices.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 2,
                                  childAspectRatio: 1.6,
                                  crossAxisCount:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 2
                                          : 4),
                          itemBuilder: (context, index) {
                            String product =
                                pp.Findproduct(cc.invoices[index].productId!)
                                    .toString();
                            String supplier =
                                ss.FindSupplaerName(cc.invoices[index].supplierId!)
                                    .toString();
                            return InkWell(
                              onTap: () {
                                invoice_info_dialog(
                                    cc.invoices[index], product, supplier);
                              },
                              child: Card(
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
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            text: cc.invoices[index].createdAt
                                                .toString()
                                                .substring(0, 9),
                                            wight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "Id :",
                                            fontSize: 14,
                                            coler: Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 25,
                                          ),
                                          CustomText(
                                            text: cc.invoices[index].id
                                                .toString()
                                                .substring(0, 5),
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
                                            text: supplier,
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
                                            text:
                                                "${cc.invoices[index].totalPrice} s.p",
                                            wight: FontWeight.bold,
                                            coler: Colors.orange.shade400,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                : const Center(child: Text("no data"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        })
      ],
    );
  }

  Future<dynamic> invoice_info_dialog(
      InvoiceData data, String product, String suplayer) {
    return Get.defaultDialog(
      title: "invoice details",
      content: Expanded(
        child: Container(
          width: 400,
          decoration: BoxDecoration(
              color: P2.withOpacity(0.1),
              border: Border.all(
                color: P2,
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(
                10,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cardDetails(
                  header: "invoice id",
                  data: data.id!,
                ),
                cardDetails(
                  header: "date",
                  data: data.createdAt.toString().substring(0, 9),
                ),
                cardDetails(
                  header: "numberOfBox",
                  data: data.numberOfBox.toString(),
                ),
                cardDetails(
                  header: "supplier",
                  data: suplayer,
                ),
                CustomText(
                  text: "items",
                  wight: FontWeight.bold,
                  coler: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomText(
                  text:
                      "      $product   x ${data.quantity}  = ${data.totalPrice}",
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
