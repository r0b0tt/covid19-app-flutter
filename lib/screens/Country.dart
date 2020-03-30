import 'package:covid19/assets/app_colors.dart';
import 'package:covid19/cases_bar_chart.dart';
import 'package:covid19/cases_gauge_chart.dart';
import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  static const cardTitleStyles = TextStyle(color: AppColors.BLUE, fontSize: 14);
  static const patientsNumberStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Name"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Locations",
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
                                label: Text(""),
                              ),
                              DataColumn(label: Text("Infected")),
                              DataColumn(label: Text("Recovered")),
                              DataColumn(label: Text("Dead")),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text(
                                  "Nairobi",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("3")),
                                DataCell(Text("2")),
                                DataCell(Text("0")),
                              ]),
                            ],
                          ),
                        )),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
