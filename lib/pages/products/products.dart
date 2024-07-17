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
  ProductController cc = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DataTable(
                      columnSpacing: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      dataRowColor: WidgetStateProperty.all(Colors.white),
                      // Datatable widget that have the property columns and rows.
                      columns: const [
                        // Set the name of the column
                        DataColumn(
                          label: Text('ID'),
                        ),
                        DataColumn(
                          label: Text('Name'),
                        ),
                        DataColumn(
                          label: Text('LastName'),
                        ),
                        DataColumn(
                          label: Text('Age'),
                        ),
                        DataColumn(
                          label: Text('action'),
                        )
                      ],
                      rows: [
                        // Set the values to the columns
                        DataRow(selected: true, cells: [
                          const DataCell(Text("1")),
                          const DataCell(Text("Alex")),
                          const DataCell(Text("Anderson")),
                          const DataCell(Text("18")),
                          DataCell(IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          )),
                        ]),
                        DataRow(cells: [
                          const DataCell(Text("2")),
                          const DataCell(Text("John")),
                          const DataCell(Text("Anderson")),
                          const DataCell(Text("24")),
                          DataCell(IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          ))
                        ]),
                      ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> ADD_SUPLAYER_DIALOG() {
    return Get.defaultDialog(
      title: "ADD SUPLAYER",
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
                    height: 15,
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
                  Container(
                    child: dropDown(
                      genderItems: cc.brandName,
                      name: "brands",
                      onSave: (Value) {
                        // cc.brandId(Value);
                      },
                    ),
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
