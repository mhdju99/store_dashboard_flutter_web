import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_dashbord/controllers/categoryController.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/model/category_model.dart';
import 'package:store_dashbord/pages/overview/widget/card_larg.dart';
import 'package:store_dashbord/widgets/CustomTextField.dart';
import 'package:store_dashbord/widgets/alertDilog.dart';
import 'package:store_dashbord/widgets/customText.dart';

class category extends StatelessWidget {
  category({super.key});
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    categoryController cc = Get.find<categoryController>();

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
              text: "Category",
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
                  text: "My category",
                  fontSize: 22,
                  wight: FontWeight.bold,
                )),
                ElevatedButton.icon(
                  onPressed: () {
                    ADD_category_DIALOG();
                  },
                  icon: const Icon(
                    // <-- Icon
                    Icons.add,
                    size: 24.0,
                  ),
                  label: const Text('Add category'), // <-- Text
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
                  return cc.category.isNotEmpty
                      ? tabel(
                          listofitem: cc.category,
                        )
                      : const Center(child: Text("no data"));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> ADD_category_DIALOG() {
    categoryController cc = Get.find<categoryController>();

    return Get.defaultDialog(
      title: "ADD category",
      content: Container(
        padding: const EdgeInsets.all(16),
        width: 400,
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  CustomTextField(
                    text: "category name",
                    onSave: (val) {
                      cc.name = val;
                    },
                  ),
                  const SizedBox(
                    height: 20,
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
  categoryController cc = Get.put(categoryController());

  List<categoryData> listofitem = [];
  tabel({
    Key? key,
    required this.listofitem,
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
                label: Text('Name'),
              ),
              DataColumn(
                label: Text('created At'),
              ),
              DataColumn(
                label: Text('action'),
              ),
            ],
            rows: List<DataRow>.generate(listofitem.length, (index) {
              final x = listofitem[index].categoryid;
              final y = listofitem[index].categoryName;
              final z = listofitem[index].categorydate;

              return DataRow(cells: [
                DataCell(SizedBox(child: Text(y!))),
                DataCell(Container(child: Text(z!))),
                DataCell(Container(
                    child: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: "category INFO",
                      content: Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          width: 500,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                cardDetails(
                                  header: "id",
                                  data: x!,
                                ),
                                cardDetails(
                                  header: "name",
                                  data: y,
                                ),
                                cardDetails(
                                  header: "created at",
                                  data: z,
                                ),
                                const SizedBox(height: 50),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Get.back();
                                    Get.defaultDialog(
                                        title: ' Alert',
                                        middleText: 'Do you want to delet?',
                                        onConfirm: () {
                                          cc.del(listofitem[index].categoryid!);
                                          Get.back();
                                          // cc.del(listofitem[index].suplayerID!);
                                        },
                                        textConfirm: 'yes',
                                        confirmTextColor: Colors.amberAccent,
                                        textCancel: 'no');
                                  },
                                  style: ButtonStyle(
                                      shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      )),
                                      side: WidgetStateProperty.all(
                                          BorderSide.none),
                                      textStyle: WidgetStateProperty.all(
                                          const TextStyle(color: Colors.white)),
                                      backgroundColor:
                                          WidgetStateProperty.all(Colors.red)),
                                  icon: const Icon(
                                    // <-- Icon
                                    Icons.delete,
                                    size: 24.0,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'Remove category',
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
                  },
                  child: const Text(
                    "view",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ))),
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
