import 'package:covid19/components/TopNavBar.dart';
import 'package:covid19/resources/app_colors.dart';
import 'package:flutter/material.dart';

class Countries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          children: <Widget>[
            TopNavBar(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                            hintText: "Search Country",
                            fillColor: Colors.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            "Countries",
                            style:
                                TextStyle(color: AppColors.BLUE, fontSize: 14),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          DataTable(
                            columnSpacing: 8,
                            columns: [
                              DataColumn(
                                label: Text("Country"),
                              ),
                              DataColumn(label: Text("Infected")),
                              DataColumn(label: Text("Recovered")),
                              DataColumn(label: Text("Dead")),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "China",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
