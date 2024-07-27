// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_dashbord/controllers/inventoryController.dart';

import 'package:store_dashbord/controllers/suplayerController.dart';
import 'package:store_dashbord/controllers/visionController.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/model/poduct_model.dart';
import 'package:store_dashbord/model/suplayer_model.dart';
import 'package:store_dashbord/pages/overview/widget/card_larg.dart';
import 'package:store_dashbord/widgets/CustomTextField.dart';
import 'package:store_dashbord/widgets/alertDilog.dart';
import 'package:store_dashbord/widgets/customText.dart';

class inventory extends StatelessWidget {
  inventory({super.key});
  final formkey = GlobalKey<FormState>();
  visionController cc = Get.put(visionController());
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
              text: "inventory",
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
                  text: "inventory",
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
                  label: const Text('Add suplayer'), // <-- Text
                ),
                IconButton(
                    onPressed: () {
                      cc.refresh();
                    },
                    icon: const Icon(Icons.refresh))
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                if (!cc.loading.value) {
                  return cc.product.isNotEmpty
                      ? tabel()
                      : const Center(child: Text("no data"));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> ADD_SUPLAYER_DIALOG() {
    suplayerController cc = Get.find<suplayerController>();

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
                children: [
                  CustomTextField(
                    text: "name",
                    onSave: (val) {
                      cc.name = val;
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CustomTextField(
                    text: "Email",
                    onSave: (val) {
                      cc.email = val;
                    },
                    type: TextInputType.emailAddress,
                    // validate: (e) {
                    //   return authControlar.validateEmail(e);
                    // },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CustomTextField(
                    onSave: (val) {
                      cc.phone = val;
                    },
                    // validate: (e) {
                    //   return cc.validatePassword(e);
                    // },
                    text: "phone",
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CustomTextField(
                    text: "country",
                    onSave: (val) {
                      cc.country = val;
                    },

                    // validate: (e) {
                    //   return authControlar.validateEmail(e);
                    // },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CustomTextField(
                    minline: 6,
                    text: "des",
                    onSave: (val) {
                      cc.descraption = val;
                    },

                    // validate: (e) {
                    //   return authControlar.validateEmail(e);
                    // },
                  ),
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
          cc.add();
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

class tabel extends StatelessWidget {
  inventoryController cc = Get.put(inventoryController());

  Map m = {"66a3c8b94c1fd632a51cbcb0": 18, "66a3c85a4c1fd632a51cbc9c": 33};

  tabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DataTable(
            columnSpacing: 40,
            headingTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            dataRowColor: WidgetStateProperty.all(Colors.white),

            // Datatable widget that have the property columns and rows.
            columns: const [
              // Set the name of the column

              DataColumn(
                label: Text('image'),
              ),
              DataColumn(
                label: Text('name'),
              ),
              DataColumn(
                label: Text('real '),
              ),
              DataColumn(
                label: Text('computer vision'),
              ),
            ],
            rows: List<DataRow>.generate(m.length, (index) {
              List p = cc.tolists(m);

              final id = p[index]["id"];
              final q = p[index]["q"];
              ProductData product = cc.Findproduct(id);

              return DataRow(cells: [
                DataCell(SizedBox(
                    child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.network(product.imageCovered)))),
                DataCell(Container(child: Text(product.title))),
                DataCell(Container(
                    child: Text(product.repoInfo.numberOfBox.toString()))),
                DataCell(Container(child: Text(q.toString()))),
              ]);
            })),
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
