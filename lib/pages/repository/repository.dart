// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/controllers/inventoryController.dart';
import 'package:store_dashbord/controllers/suplayerController.dart';
import 'package:store_dashbord/model/poduct_model.dart';
import 'package:store_dashbord/model/product_details/product_details.dart';
import 'package:store_dashbord/widgets/CustomTextField.dart';
import 'package:store_dashbord/widgets/customText.dart';
import 'package:store_dashbord/widgets/dropDown.dart';

class repository extends StatefulWidget {
  const repository({super.key});

  @override
  State<repository> createState() => _inventoryState();
}

class _inventoryState extends State<repository> {
  final formkey = GlobalKey<FormState>();

  // inventoryController cc = Get.put(inventoryController(),permanent: F);
  @override
  Widget build(BuildContext context) {
    inventoryController cc = Get.find<inventoryController>();

    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 50,),
        Padding(
          padding: EdgeInsets.only(top: 20, left: width / 100),
          child: CustomText(
            text: "repository management",
            fontSize: 27,
            wight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: width / 80),
          child: Row(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: SizedBox(
                  width: 500,
                  child: TabBar(
                    controller: cc.controller,
                    tabs: cc.myTabs,
                    dividerHeight: 2,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: Colors.green,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(
                  width: 10,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setting_dialog();
                },
                icon: const Icon(Icons.settings),
                label: const Text("inventory setting"),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  minimumSize: WidgetStateProperty.all(const Size(130, 40)),
                  elevation: WidgetStateProperty.all(0),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    cc.refresh();
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),

        Obx(() {
          if (!cc.loading.value) {
            return cc.product.isNotEmpty
                ? Expanded(
                    child: TabBarView(controller: cc.controller, children: [
                      tabel(
                        listofitem: cc.product,
                      ),
                      tabel(
                        listofitem: cc.not_added,
                      ),
                      tabel(
                        listofitem: cc.not_added,
                      ),
                      const Text("data")
                    ]),
                  )
                : const Center(child: Text("no data"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ],
    );
  }

  Future<dynamic> setting_dialog() {
    int selectedValue = 1;
    double currentSliderValue = 33;

    return Get.defaultDialog(
      title: "INFO",
      content: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SettingDetails(
                  data: Column(
                children: [
                  ListTile(
                      tileColor: Colors.white,
                      title: const Text("ِAuto inventory"),
                      trailing: Switch(
                        value: true,
                        onChanged: (T) {},
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        value: 0,
                        groupValue: selectedValue,
                        onChanged: (Value) {},
                      ),
                      const Text(
                        'daily',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        value: 1,
                        groupValue: selectedValue,
                        onChanged: (Value) {},
                      ),
                      const Text(
                        'wekliy',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Radio(
                        value: 2,
                        groupValue: selectedValue,
                        onChanged: (Value) {},
                      ),
                      const Text(
                        'Monthly',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              )),
              SettingDetails(
                data: ListTile(
                    tileColor: Colors.white,
                    title: const Text("ِLow stock notice"),
                    trailing: Switch(
                      value: true,
                      onChanged: (T) {},
                    )),
              ),
              SettingDetails(
                data: ListTile(
                    tileColor: Colors.white,
                    title: const Text("ِinventory notice"),
                    trailing: Switch(
                      value: true,
                      onChanged: (T) {},
                    )),
              ),
              SettingDetails(
                data: Column(
                  children: [
                    const Text("ِLow stock level :"),
                    Slider(
                      value: currentSliderValue,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      label: "level",
                      onChanged: (double value) {
                        setState(() {
                          currentSliderValue = value;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
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
        decoration: BoxDecoration(color: P1.withOpacity(0.1)),
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

class SettingDetails extends StatelessWidget {
  Widget data;

  SettingDetails({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(color: P1.withOpacity(0.1)),
        padding: const EdgeInsets.all(7),
        child: data,
      ),
    );
  }
}

class tabel extends StatelessWidget {
  final formkey = GlobalKey<FormState>();

  List<ProductData> listofitem = [];
  tabel({
    Key? key,
    required this.listofitem,
  }) : super(key: key);
  static final navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DataTable(
          headingTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          dividerThickness: 0.2,
          dataTextStyle: const TextStyle(fontSize: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(0),
          ),
          dataRowColor: WidgetStateProperty.all(Colors.grey.shade200),
          columns: const [
            DataColumn(
                label: Text(
              "image",
            )),
            DataColumn(
                label: Text(
              "name",
            )),
            DataColumn(
                label: Text(
              "id",
            )),
            DataColumn(
                label: Text(
              "Quantity",
            )),
            DataColumn(
              label: Text(
                "box",
              ),
            ),
            DataColumn(
                label: Text(
              "edit",
            )),
            DataColumn(
                label: Text(
              "add",
            ))
          ],
          rows: List<DataRow>.generate(listofitem.length, (index) {
            final image = listofitem[index].imageCovered;
            final title = listofitem[index].title;
            final id = listofitem[index].id;
            final Quantity = listofitem[index].repoInfo.currantQuantity;
            final box = listofitem[index].repoInfo.numberOfBox;

            return DataRow(cells: [
              DataCell(SizedBox(
                  child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.network(image.toString())))),
              DataCell(Container(child: Text(title))),
              DataCell(Container(child: Text(id))),
              DataCell(Container(child: Text(Quantity.toString()))),
              DataCell(Container(child: Text(box.toString()))),
              DataCell(Container(
                  child: InkWell(
                onTap: () {
                  producr_details(id: listofitem[index].id);
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
              DataCell(Container(
                  child: IconButton(
                onPressed: () {
                  ADD_Quantity(listofitem[index].id);
                },
                icon: const Icon(
                  Icons.add_box_rounded,
                  color: Colors.green,
                ),
              )))
            ]);
          })),
    );
  }

  Future<dynamic> producr_details({required String id}) {
    inventoryController cc = Get.find<inventoryController>();

    return Get.defaultDialog(
      title: "INFO",
      content: FutureBuilder<ProductDetails>(
          future: cc.fetchProductDetails(id), // async work
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Text("error");
            } else if (snapshot.hasData) {
              ProductDetails? data = snapshot.data;
              return Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Cardinv(
                              color: P1,
                              header: "salesQuantity",
                              data: data!.repoInfo!.salesQuantity.toString(),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Cardinv(
                              header: "Quantity",
                              data: data.repoInfo!.currantQuantity.toString(),
                              color: CN2,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Cardinv(
                              header: "numberOfBox",
                              data: data.repoInfo!.numberOfBox.toString(),
                              color: CN3,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        cardDetails(
                          header: "NAME",
                          data: data.title.toString(),
                        ),
                        cardDetails(
                          header: "id",
                          data: data.id.toString(),
                        ),
                        cardDetails(
                          header: "suplayer",
                          data:
                              data.repoInfo!.supplier!.suplayerName.toString(),
                        ),
                        cardDetails(
                            header: "price",
                            data: data.repoInfo!.price.toString()),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Text('Result: ${snapshot.data}');
            }
          }),
      onCancel: () {
        Get.back();
      },
      textCancel: "undo",
    );
  }

  Future<dynamic> ADD_Quantity(String id) {
    inventoryController cc = Get.find<inventoryController>();
    suplayerController ss = Get.find<suplayerController>();

    return Get.defaultDialog(
      title: "ADD Quantity",
      content: Container(
        padding: const EdgeInsets.all(16),
        width: 400,
        child: Expanded(
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    text: "price",
                    onSave: (val) {
                      cc.price = int.parse(val.toString());
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CustomTextField(
                    text: "Quantity",
                    onSave: (val) {
                      cc.Quantity = int.parse(val.toString());
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
                      cc.productInBox = int.parse(val.toString());
                    },
                    // validate: (e) {
                    //   return cc.validatePassword(e);
                    // },
                    text: "productInBox",
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CustomTextField(
                    text: "numberOfBox",
                    onSave: (val) {
                      cc.numberOfBox = int.parse(val.toString());
                    },

                    // validate: (e) {
                    //   return authControlar.validateEmail(e);
                    // },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  dropDown(
                    genderItems:
                        ss.suplayers.map((val) => val.suplayerName).toList(),
                    name: "suplayer",
                    onSave: (Value) {
                      cc.suplaier = ss.FindSupplaerID(Value.toString());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onConfirm: () async {
        formkey.currentState!.save();
        cc.add(id);
        Get.back();
      },
      textCancel: "undo",
      textConfirm: "ADD",
    );
  }
}

class Cardinv extends StatelessWidget {
  Color color;
  String header;
  String data;
  Cardinv({
    Key? key,
    required this.color,
    required this.header,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              header.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(data.toString(),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.white)) // Adds a price to the bottom of the card
          ],
        ),
      ), // Adds a gradient background and rounded corners to the container
    );
  }
}
