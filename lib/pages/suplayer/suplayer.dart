// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';

import 'package:store_dashbord/controllers/suplayerController.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/model/suplayer_model.dart';
import 'package:store_dashbord/pages/overview/widget/card_larg.dart';
import 'package:store_dashbord/widgets/CustomTextField.dart';
import 'package:store_dashbord/widgets/alertDilog.dart';
import 'package:store_dashbord/widgets/customText.dart';

class suplayer extends StatelessWidget {
  suplayer({super.key});
  final formkey = GlobalKey<FormState>();

  suplayerController cc = Get.put(suplayerController());
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
              text: "suplayer",
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
                  text: "My suplayer",
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
                  return cc.suplayers.isNotEmpty
                      ? tabel(
                          listofitem: cc.suplayers,
                        )
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
  suplayerController cc = Get.put(suplayerController());

  List<SuplayerData> listofitem = [];
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
            dataRowColor: MaterialStateProperty.all(Colors.white),

            // Datatable widget that have the property columns and rows.
            columns: const [
              // Set the name of the column

              DataColumn(
                label: Text('Name'),
              ),
              DataColumn(
                label: Text('Countres'),
              ),
              DataColumn(
                label: Text('Emai'),
              ),
              DataColumn(
                label: Text('PhoneNumber'),
              ),
              DataColumn(
                label: Text('details'),
              )
            ],
            rows: List<DataRow>.generate(listofitem.length, (index) {
              final x = listofitem[index].suplayerName;
              final y = listofitem[index].suplayerCountres;
              final z = listofitem[index].suplayerEmail;
              final a = listofitem[index].suplayerPhoneNumber;
              final d = listofitem[index].suplayerDescription;

              return DataRow(cells: [
                DataCell(SizedBox(child: Text(x!))),
                DataCell(Container(child: Text(y!))),
                DataCell(Container(child: Text(z!))),
                DataCell(Container(child: Text(a!))),
                DataCell(Container(
                    child: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: "SUPLAYER INFO",
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
                                  header: "NAME",
                                  data: x,
                                ),
                                cardDetails(
                                  header: "Countres",
                                  data: y,
                                ),
                                cardDetails(
                                  header: "EMAIL",
                                  data: z,
                                ),
                                cardDetails(
                                  header: "PHONE",
                                  data: a,
                                ),
                                cardDetails(
                                  header: "DETAILS",
                                  data: d!,
                                ),
                                const SizedBox(height: 50),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Get.back();
                                    Get.defaultDialog(
                                        title: ' Alert',
                                        middleText: 'Do you want to close?',
                                        onConfirm: () {
                                          cc.del(listofitem[index].suplayerID!);
                                          Get.back();
                                          // cc.del(listofitem[index].suplayerID!);
                                        },
                                        textConfirm: 'yes',
                                        confirmTextColor: Colors.amberAccent,
                                        textCancel: 'no');
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      )),
                                      side: MaterialStateProperty.all(
                                          BorderSide.none),
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(color: Colors.white)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
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

