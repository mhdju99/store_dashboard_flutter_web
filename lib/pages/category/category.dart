import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/pages/overview/widget/card_larg.dart';
import 'package:store_dashbord/widgets/alertDilog.dart';
import 'package:store_dashbord/widgets/customText.dart';

class category extends StatelessWidget {
  const category({super.key});

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
                    Get.defaultDialog(
                      title: "k",
                      content: const SizedBox(
                        height: 400,
                        width: 900,
                      ),
                      textCancel: "undo",
                      textConfirm: "ADD",
                    );
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
                      dataRowColor: MaterialStateProperty.all(Colors.white),
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
}

