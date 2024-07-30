// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/controllers/inventoryController.dart';
import 'package:store_dashbord/controllers/suplayerController.dart';
import 'package:store_dashbord/controllers/visionController.dart';
import 'package:store_dashbord/model/poduct_model.dart';
import 'package:store_dashbord/pages/testpage.dart';
import 'package:store_dashbord/widgets/CustomTextField.dart';
import 'package:store_dashbord/widgets/customText.dart';

class inventory extends StatelessWidget {
  inventory({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    visionController cc = Get.put(visionController());

    double width = MediaQuery.of(context).size.width;
    return Column(
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
              IconButton(
                  onPressed: () {
                  
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ),

        Expanded(
            child: TabBarView(controller: cc.controller, children: [
          page1(),
          page3(),
          const Text("data"),
        ])),
      ],
    );
  }

  Widget page1() {
    visionController cc = Get.put(visionController());

    return Center(
      child: Obx(() {
        return cc.isOriginalContent.value
            ? _buildOriginalContent()
            : _buildNewContent();
      }),
    );
  }

  Widget page3() {
    visionController cc = Get.put(visionController());
    cc.fetch_inventory_Hestory();
    return Obx(() {
      if (!cc.loading_h_vison.value) {
        return cc.inventoryList.isNotEmpty
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DataTable(
                          columnSpacing: 40,
                          headingTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          dataRowColor:
                              WidgetStateProperty.all(Colors.grey.shade200),

                          // Datatable widget that have the property columns and rows.
                          columns: const [
                            // Set the name of the column

                            DataColumn(
                              label: Text('number'),
                            ),
                            DataColumn(
                              label: Text('Date'),
                            ),
                            DataColumn(
                              label: Text('total quantities '),
                            ),
                            DataColumn(
                              label: Text('state '),
                            ),
                          ],
                          rows: List<DataRow>.generate(cc.inventoryList.length,
                              (index) {
                            // var m = xx.finalInventory;

                            // List p = cc.tolists(m);

                            // final id = p[index]["id"];
                            // final q = p[index]["q"];
                            // ProductData product = cc.Findproduct(id);

                            return DataRow(cells: [
                              DataCell(Text(index.toString())),
                              DataCell(Container(
                                  child: Text(cc.inventoryList[index].date
                                      .toString()))),
                              const DataCell(Text("d")),
                              const DataCell(Text("d")),
                            ]);
                          })),
                    ),
                  ),
                ],
              )
            : const Center(child: Text("no data"));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }

  Widget _buildOriginalContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            textStyle: const TextStyle(
              fontSize: 32.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            visionController cc = Get.find<visionController>();

            cc.toggleContent();
            cc.fetch_vesion();
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Start inventory",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNewContent() {
    visionController cc = Get.find<visionController>();
    print("ssssss");
    return Obx(() {
      if (!cc.loading.value && !cc.loading_vison.value) {
        return cc.product.isNotEmpty
            ? tabel()
            : const Center(child: Text("no data"));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

class tabel extends StatelessWidget {
  visionController cc = Get.put(visionController());

  tabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var xx = cc.Get_vison;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTable(
                columnSpacing: 40,
                headingTextStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(0),
                ),
                dataRowColor: WidgetStateProperty.all(Colors.grey.shade200),

                // Datatable widget that have the property columns and rows.
                columns: const [
                  // Set the name of the column

                  DataColumn(
                    label: Text('.'),
                  ),
                  DataColumn(
                    label: Text('product'),
                  ),
                  DataColumn(
                    label: Text('Actual quantities '),
                  ),
                  DataColumn(
                    label: Text('Inventory results'),
                  ),
                ],
                rows:
                    List<DataRow>.generate(xx.finalInventory!.length, (index) {
                  var m = xx.finalInventory;

                  List p = cc.tolists(m);

                  final id = p[index]["id"];
                  final q = p[index]["q"];
                  ProductData product = cc.Findproduct(id);

                  return DataRow(cells: [
                    DataCell(SizedBox(
                        child: SizedBox(
                            width: 40,
                            height: 49,
                            child: InstaImageViewer(
                              child: Image(
                                image:
                                    Image.network(product.imageCovered).image,
                              ),
                            )))),
                    DataCell(Container(child: Text(product.title))),
                    DataCell(Center(
                      child: Container(
                          child: Text(
                        product.repoInfo.numberOfBox.toString(),
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )),
                    )),
                    DataCell(Center(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          0,
                        ),
                        color: Colors.green.withOpacity(0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          q.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ))),
                  ]);
                })),
          ),
        ),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 15, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cardDetails(
                    header: "Execution Time",
                    data: xx.execution_time!.toStringAsFixed(2),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  cardDetails(
                    header: "Data",
                    data: xx.date.toString(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Get.defaultDialog(
                              title: "details",
                              content: Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  width: 600,
                                  child: ListView.builder(
                                      itemCount: xx.shelfResults!.length,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          child: Container(
                                            color: P2.withOpacity(0.1),
                                            padding: const EdgeInsets.all(7),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Cardinv(
                                                    color: P1,
                                                    header: "section",
                                                    data: xx
                                                        .shelfResults![index]
                                                        .shelf
                                                        .toString(),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: smalltabel(
                                                    xx: cc.tolists(xx
                                                        .shelfResults![index]
                                                        .objects),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                      width: 100,
                                                      height: 120,
                                                      child: InstaImageViewer(
                                                        child: Image(
                                                          image: Image.network(xx
                                                                  .shelfResults![
                                                                      index]
                                                                  .resultImage
                                                                  .toString())
                                                              .image,
                                                        ),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                              textCancel: "undo",
                              textConfirm: "ADD",
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "details",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                              cc.fetchProduct();
                            cc.toggleContent();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Repeat ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
      ],
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
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.black, width: 0.7),
        borderRadius: BorderRadius.circular(2),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CustomText(
            text: "$header :",
            wight: FontWeight.bold,
            fontSize: 15,
          ),
          const SizedBox(
            width: 20,
          ),
          CustomText(
            text: data,
            coler: P1,
            fontSize: 18,
          ),
        ],
      ),
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
        height: 90,
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

class smalltabel extends StatelessWidget {
  List xx;
  visionController cc = Get.put(visionController());

  smalltabel({
    Key? key,
    required this.xx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: DataTable(
              columnSpacing: 15,
              headingRowHeight: 20,
              headingTextStyle:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              dataRowColor: WidgetStateProperty.all(Colors.grey.shade200),

              // Datatable widget that have the property columns and rows.
              columns: const [
                // Set the name of the column

                DataColumn(
                  label: Text('.'),
                ),
                DataColumn(
                  label: Text('product'),
                ),
                DataColumn(
                  label: Text('q'),
                ),
              ],
              rows: List<DataRow>.generate(xx.length, (index) {
                var m = xx;

                List p = m;

                final id = p[index]["id"];
                final q = p[index]["q"];
                ProductData product = cc.Findproduct(id);

                return DataRow(cells: [
                  DataCell(SizedBox(
                      child: SizedBox(
                          width: 40,
                          height: 49,
                          child: InstaImageViewer(
                            child: Image(
                              image: Image.network(product.imageCovered).image,
                            ),
                          )))),
                  DataCell(Container(
                      child: Text(
                    product.title,
                    maxLines: 2,
                  ))),
                  DataCell(Center(
                    child: Text(
                      q.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  )),
                ]);
              })),
        )
      ],
    );
  }
}
