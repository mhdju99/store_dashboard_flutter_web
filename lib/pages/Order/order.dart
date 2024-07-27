import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/controllers/orderController.dart';
import 'package:store_dashbord/pages/category/category.dart';
import 'package:store_dashbord/widgets/customText.dart';
import 'package:store_dashbord/widgets/dropDown.dart';

class Order extends StatelessWidget {
  Order({super.key});
  final formkey = GlobalKey<FormState>();
  List<String?> ccs = ["d", "e"];

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
              text: "Orders",
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
                      2,
                    ),
                    color: Colors.green,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Complete",
                      style: TextStyle(color: Colors.white, fontSize: 12),
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
                    color: Colors.red,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "canceled",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                )),
                DataCell(InkWell(
                  child: const Icon(Icons.edit),
                  onTap: () {
                    Get.defaultDialog(
                      navigatorKey: navKey,
                      title: "Orders INFO",
                      content: Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: 600,
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: "items",
                                          wight: FontWeight.bold,
                                          coler: Colors.grey,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomText(
                                                text: "data",
                                              ),
                                            ),
                                            Expanded(
                                              child: CustomText(
                                                text: "data",
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomText(
                                                text: "Total Price ",
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: CustomText(
                                                coler: Colors.green,
                                                text: "123333 s.p",
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomText(
                                                text: "order status",
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: dropDown(
                                                genderItems: const [
                                                  "sadas",
                                                  "Asdas"
                                                ],
                                                name: "brands",
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
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
