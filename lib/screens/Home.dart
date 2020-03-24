import 'package:covid19/cases_bar_chart.dart';
import 'package:covid19/cases_gauge_chart.dart';
import 'package:covid19/components/BottomNavBar.dart';
import 'package:covid19/components/TopNavBar.dart';
import 'package:covid19/resources/app_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const cardTitleStyles = TextStyle(color: AppColors.BLUE, fontSize: 14);
  static const patientsNumberStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              TopNavBar(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                    elevation: 5,
                    child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Cases (2020)",
                              style: cardTitleStyles,
                            ),
                            SizedBox(height: 12),
                            AspectRatio(
                              aspectRatio: 1.75,
                              child: CasesBarChart.withSampleData(),
                            ),
                          ],
                        ))),
              ),
              SizedBox(height: 12),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: Card(
                        elevation: 5,
                        child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Infected",
                                  style: cardTitleStyles,
                                ),
                                SizedBox(height: 12),
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: GaugeChart.withSampleData("infected"),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "311,989",
                                  style: patientsNumberStyle,
                                ),
                                SizedBox(height: 8),
                                Text(""),
                              ],
                            )),
                      )),
                      Expanded(
                          child: Card(
                        elevation: 5,
                        child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Recovered",
                                  style: cardTitleStyles,
                                ),
                                SizedBox(height: 12),
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: GaugeChart.withSampleData("recovered"),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "93,790",
                                  style: patientsNumberStyle,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "48%",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            )),
                      )),
                      Expanded(
                          child: Card(
                        elevation: 5,
                        child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Dead",
                                  style: cardTitleStyles,
                                ),
                                SizedBox(height: 12),
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: GaugeChart.withSampleData("dead"),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "13,407",
                                  style: patientsNumberStyle,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "2.3%",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            )),
                      )),
                    ],
                  )),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                    elevation: 5,
                    child: Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Most Affected Countries",
                                  style: TextStyle(
                                      color: AppColors.BLUE, fontSize: 14),
                                ),
                                Text(
                                  "View All",
                                  style: TextStyle(
                                      color: AppColors.BLUE, fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Container(
                                child: SingleChildScrollView(
                              child: DataTable(
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                    DataCell(Text("123,000")),
                                    DataCell(Text("101,000")),
                                    DataCell(Text("11,000")),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text(
                                      "Italy",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                    DataCell(Text("101,000")),
                                    DataCell(Text("56,000")),
                                    DataCell(Text("5,000")),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text(
                                      "USA",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                    DataCell(Text("97,000")),
                                    DataCell(Text("48,000")),
                                    DataCell(Text("1,000")),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text(
                                      "South Korea",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                    DataCell(Text("88,000")),
                                    DataCell(Text("20,000")),
                                    DataCell(Text("3,000")),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text(
                                      "Mexico",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                    DataCell(Text("56,000")),
                                    DataCell(Text("36,000")),
                                    DataCell(Text("500")),
                                  ]),
                                ],
                              ),
                            )),
                          ],
                        ))),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                    elevation: 5,
                    child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "World Map",
                              style: TextStyle(
                                  color: AppColors.BLUE, fontSize: 14),
                            ),
                            SizedBox(height: 12),
                            Container(
                              height: 144,
                              color: Colors.black12,
                              child: Image.network(
                                'https://picsum.photos/250?image=9',
                              ),
                            )
                          ],
                        ))),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
