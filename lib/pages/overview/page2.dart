import 'package:flutter/material.dart';
import 'package:store_dashbord/constants/style.dart';
import 'package:store_dashbord/helper/responsiveness.dart';
import 'package:store_dashbord/pages/overview/widget/card_larg.dart';
import 'package:store_dashbord/pages/overview/widget/card_long.dart';
import 'package:store_dashbord/widgets/customText.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class page2 extends StatelessWidget {
  const page2({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 50,),
        Padding(
          padding: EdgeInsets.only(top: 20, left: width / 100),
          child: CustomText(
            text: "Overview",
            fontSize: 27,
            wight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: !ResponsiveWidget.isSmallScreen(context)
              ? largc(width: width)
              : smallc(width: width),
        )
      ],
    );
  }
}

class largc extends StatelessWidget {
  List<CountList> chartData = [
    CountList('pending order', 70, P1),
    CountList('processed orders', 10, P2),
    CountList('cancelled orders', 90, CN3),
    // CountList('pending rders', 55, CN2),
    // CountList('pending rders', 77, CN3),
  ];
  largc({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 6,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  // scrollDirection: Axis.horizontal,
                  children: [
                    CardLarg(
                      color: CN1,
                    ),
                    SizedBox(
                      width: width / 80,
                    ),
                    CardLarg(
                      color: CN2,
                    ),
                    SizedBox(
                      width: width / 80,
                    ),
                    CardLarg(
                      color: P1,
                    ),
                    SizedBox(
                      width: width / 80,
                    ),
                    CardLarg(
                      color: CN3,
                    ),
                    SizedBox(
                      width: width / 80,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  // scrollDirection: Axis.horizontal,
                  children: [
                    card_long(
                      p: 0.6,
                      chaild: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DataTable(
                            dataRowColor: WidgetStateProperty.all(Colors.white),
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                            columnSpacing: 40,
                            decoration: const BoxDecoration(
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),

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
                    SizedBox(
                      width: width / 80,
                    ),
                    // const CardLarg(),
                    // SizedBox(
                    //   width: width / 80,
                    // ),
                    // const CardLarg(),
                    // SizedBox(
                    //   width: width / 80,
                    // ),
                  ],
                )
              ],
            )),
        card_long(
          p: 0.8,
          chaild: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(5),
                child: const Text(
                  "Order Details",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SfCircularChart(
                      series: <CircularSeries>[
                        DoughnutSeries<CountList, String>(
                          startAngle: 270,
                          endAngle: 270,
                          innerRadius: "80",
                          pointColorMapper: (CountList data, _) => data.x,
                          dataSource: chartData,
                          xValueMapper: (CountList data, _) => data.status,
                          yValueMapper: (CountList data, _) => data.number,
                        )
                      ],
                      // your configurations
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "434",
                          fontSize: 20,
                          wight: FontWeight.bold,
                        ),
                        const Text(
                          "order",
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    )
                  ],
                ),
              ),
              ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: chartData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: chartData[index].x,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          )),
                      child: ListTile(
                          leading: const Icon(Icons.local_shipping_outlined),
                          title: CustomText(
                            text: chartData[index].status,
                            fontSize: 12,
                          ),
                          iconColor: chartData[index].x,
                          subtitle: CustomText(
                            text: "${chartData[index].number} orders",
                            fontSize: 10,
                          )),
                    );
                  })
            ],
          ),
        ),
        SizedBox(
          width: width / 100,
        ),
      ],
    );
  }
}

class smallc extends StatelessWidget {
  const smallc({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CardLarg(
              color: CN1,
            ),
            SizedBox(
              width: width / 60,
            ),
            CardLarg(
              color: CN2,
            ),
            SizedBox(
              width: width / 60,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            CardLarg(
              color: P1,
            ),
            SizedBox(
              width: width / 60,
            ),
            CardLarg(
              color: CN3,
            ),
            SizedBox(
              width: width / 60,
            ),
          ],
        )
      ],
    );
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
}

class CountList {
  CountList(this.status, this.number, this.x);

  final String status;
  final int number;
  final Color x;
}
