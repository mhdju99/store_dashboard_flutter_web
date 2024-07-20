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

class products extends StatelessWidget {
  products({super.key});
  final formkey = GlobalKey<FormState>();

  String? selectedValue;
  List<String?> ccs = ["d", "e"];
  // BrandController bb = Get.put(BrandController());

  @override
  Widget build(BuildContext context) {
    ProductController cc = Get.find<ProductController>();

    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 50,),
        Padding(
          padding: EdgeInsets.only(top: 20, left: width / 100),
          child: CustomText(
            text: "Products",
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
                text: "My products",
                fontSize: 22,
                wight: FontWeight.bold,
              )),
              ElevatedButton.icon(
                onPressed: () {
                  ADD_SUPLAYER_DIALOG();
                },
                icon: const Icon(
                  // <-- Icon
                  Icons.add,
                  size: 24.0,
                ),
                label: const Text('Add Product'), // <-- Text
              ),
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
                    mainAxisSpacing: 5,
                    crossAxisCount:
                        ResponsiveWidget.isSmallScreen(context) ? 2 : 5),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 200,
                    child: InkWell(
                      onTap: () {
                        product_info_dialog();
                      },
                      child: Card(
                        elevation: 2,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                  alignment: Alignment.topCenter,
                                  child: Image.network(
                                      fit: BoxFit.fitWidth,
                                      height: 170,
                                      "https://m.media-amazon.com/images/I/813-n5YTYiL.__AC_SY445_SX342_QL70_ML2_.jpg"
                                      // cc.Barnds[index].Image!,
                                      )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: CustomText(
                                text: "headphone",
                                fontSize: 14,
                                coler: Colors.grey,
                                wight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: CustomText(
                                // text: cc.Barnds[index].BrandName!,
                                text: "headphone",
                                fontSize: 18,
                                wight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: CustomText(
                                // text: cc.Barnds[index].BrandName!,
                                text: "sony",
                                fontSize: 14,
                                coler: Colors.grey,
                              ),
                            )
                          ],
                        ),
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

  Future<dynamic> ADD_SUPLAYER_DIALOG() {
    BrandController bb = Get.find<BrandController>();
    categoryController cat = Get.find<categoryController>();
    ProductController cc = Get.find<ProductController>();

    return Get.defaultDialog(
      title: "ADD PRODUCT",
      content: Expanded(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 600,
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [pickImage1(), pickImage2(), pickImage3()],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    text: "Product name",
                    onSave: (val) {
                      cc.name = val;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    minline: 4,
                    text: "product description",
                    onSave: (val) {
                      cc.descraption = val;
                    },

                    // validate: (e) {
                    //   return authControlar.validateEmail(e);
                    // },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  dropDown(
                    genderItems: bb.Barnds.map((val) => val.BrandName).toList(),
                    name: "brands",
                    onSave: (Value) {
                      cc.brandId(Value);
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  dropDown(
                    genderItems:
                        cat.category.map((val) => val.categoryName).toList(),
                    name: "category",
                    onSave: (Value) {
                      cc.catId(Value);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onConfirm: () {
        formkey.currentState!.save();
        if (formkey.currentState!.validate()) {
          // cc.loading = true;
          // cc.add();
        } else {
          Get.snackbar("error", " error in username or password");
        }
        Get.back();
      },
      textCancel: "undo",
      textConfirm: "ADD",
    );
  }
}

class pickImage1 extends StatelessWidget {
  ProductController cc = Get.put(ProductController());

  pickImage1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        cc.pickImage1();
      },
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Obx(() => Container(
                  alignment: Alignment.center,
                  child: cc.image1.value == null
                      ? const Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                        )
                      : Image.network(cc.image1.value!.path),
                )),
          ),
        ],
      ),
    );
  }
}

class pickImage2 extends StatelessWidget {
  ProductController cc = Get.put(ProductController());

  pickImage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        cc.pickImage2();
      },
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Obx(() => Container(
                  alignment: Alignment.center,
                  child: cc.image2.value == null
                      ? const Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                        )
                      : Image.network(cc.image2.value!.path),
                )),
          ),
        ],
      ),
    );
  }
}

class pickImage3 extends StatelessWidget {
  ProductController cc = Get.put(ProductController());

  pickImage3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        cc.pickImage3();
      },
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Obx(() => Container(
                  alignment: Alignment.center,
                  child: cc.image3.value == null
                      ? const Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                        )
                      : Image.network(cc.image3.value!.path),
                )),
          ),
        ],
      ),
    );
  }
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

class tabel extends StatelessWidget {
  const tabel({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      dataRowColor: WidgetStateProperty.all(Colors.white),
      columns: const [
        DataColumn(
            label: Text(
          "Num",
        )),
        DataColumn(
            label: Text(
          "Quiz Name",
        )),
        DataColumn(
            label: Text(
          "Lesson",
        )),
        DataColumn(
            label: Text(
          "Date",
        )),
        DataColumn(
            label: Text(
          "Details",
        )),
      ],
      rows: [
        DataRow(
          cells: [
            const DataCell(Text(
              "07",
            )),
            const DataCell(Text(
              "Mid-Term Quiz",
            )),
            const DataCell(Text(
              "The art of  2D character design",
            )),
            DataCell(
              Row(
                children: [
                  Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4QaRqKWxfrGdQ9r5U5mWg-RWItNxzmphX-Q&s"),
                  const SizedBox(width: 10),
                  const Text(
                    "11/04/2020, 13:30 PM",
                  ),
                ],
              ),
            ),
            DataCell(Image.asset(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4QaRqKWxfrGdQ9r5U5mWg-RWItNxzmphX-Q&s")),
          ],
        ),
      ],
    );
  }
}
