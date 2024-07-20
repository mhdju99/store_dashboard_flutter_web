import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/controllers/categoryController.dart';
import 'package:store_dashbord/controllers/orderController.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/model/category_model.dart';
import 'package:store_dashbord/pages/overview/widget/card_larg.dart';
import 'package:store_dashbord/widgets/CustomTextField.dart';
import 'package:store_dashbord/widgets/alertDilog.dart';
import 'package:store_dashbord/widgets/customText.dart';

class order extends StatelessWidget {
  order({super.key});
  final formkey = GlobalKey<FormState>();

  OrderController cc = Get.put(OrderController());
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
              text: "Category",
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
                IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
              ],
            ),
          ),

          const Row(
            children: [
              tabel(),
            ],
          ),
        ],
      ),
    );
  }
}

class tabel extends StatelessWidget {
  const tabel({super.key});
  static final navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
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
              "#",
            )),
            DataColumn(
                label: Text(
              "order ID",
            )),
            DataColumn(
                label: Text(
              "Customer",
            )),
            DataColumn(
                label: Text(
              "Date",
            )),
            DataColumn(
              label: Text(
                "Amount",
              ),
            ),
            DataColumn(
                label: Text(
              "Status",
            )),
            DataColumn(
                label: Text(
              "edit",
            ))
          ],
          rows: [
            DataRow(
              cells: [
                const DataCell(Text(
                  "1",
                )),
                const DataCell(Text(
                  "#3534534",
                )),
                const DataCell(Text(
                  "mhd jomaaat",
                )),
                const DataCell(Text(
                  "20000 s.p",
                )),
                const DataCell(
                  Text("2023/2/4"),
                ),
                DataCell(Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Colors.green.withOpacity(0.2),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Complete",
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ),
                )),
                const DataCell(Icon(Icons.edit))
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text(
                  "1",
                )),
                const DataCell(Text(
                  "#3534534",
                )),
                const DataCell(Text(
                  "mhd jomaaat",
                )),
                const DataCell(Text(
                  "20000 s.p",
                )),
                const DataCell(
                  Text("2023/2/4"),
                ),
                DataCell(Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Colors.green.withOpacity(0.2),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Complete",
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ),
                )),
                DataCell(InkWell(
                  child: const Icon(Icons.edit),
                  onTap: () {
                    Get.defaultDialog(
                      navigatorKey: navKey,
                      title: "SUPLAYER INFO",
                      content: Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          width: 700,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: cardDetails(
                                        header: "NAME",
                                        data: "muhameed",
                                      ),
                                    ),
                                    Expanded(
                                      child: cardDetails(
                                        header: "order id",
                                        data: "54346346343534",
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "header :",
                                            wight: FontWeight.bold,
                                            coler: Colors.grey,
                                          ),
                                          Row(
                                            children: [
                                              CustomText(
                                                maxline: 5,
                                                text: "data",
                                              ),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Expanded(
                                                child: CustomText(
                                                  maxline: 5,
                                                  text: "data",
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
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
                ))
              ],
            )
          ],
        ),
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
