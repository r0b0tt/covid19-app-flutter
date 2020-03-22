import 'package:covid19/cases_bar_chart.dart';
import 'package:covid19/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Covid-19",
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 7),
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image(
                              image: AssetImage('assets/images/icon.png'),
                              width: 36,
                              height: 36,
                              fit: BoxFit.contain,
                          ),
                          SizedBox(width: 12,),
                          Text(
                              "Covid-19",
                              style: TextStyle(
                                color: AppColors.PRIMARY,
                                fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Icon(Ionicons.ios_moon)
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child:  Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            "Cases",
                            style: TextStyle(
                              color: AppColors.BLUE,
                              fontSize: 14
                            ),
                        ),
                        SizedBox(height: 12),
                        AspectRatio(
                            aspectRatio: 1.75,
                            child: CasesBarChart.withSampleData(),

                          ),


                      ],
                    )
                  )
                ),
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
                              ),
                              SizedBox(height: 12),
                              Container(
                                height: 96,
                                color: Colors.black12
                              ),
                              SizedBox(height: 12),
                              Text("100%")
                            ],
                          )
                        ),
                      )
                    ),Expanded(
                      child: Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Recovered",
                              ),
                              SizedBox(height: 12),
                              Container(
                                height: 96,
                                color: Colors.black12
                              ),
                              SizedBox(height: 12),
                              Text("48%")
                            ],
                          )
                        ),
                      )
                    ),
                    Expanded(
                      child: Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Dead",
                              ),
                              SizedBox(height: 12),
                              Container(
                                height: 96,
                                color: Colors.black12
                              ),
                              SizedBox(height: 12),
                              Text("2.3%")
                            ],
                          )
                        ),
                      )
                    ),
                  ],
                )
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child:  Card(
                    elevation: 5,
                    child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Most Affected Countries",
                                  style: TextStyle(
                                      color: AppColors.BLUE,
                                      fontSize: 14
                                  ),
                                ),
                                Text(
                                  "View All",
                                  style: TextStyle(
                                      color: AppColors.BLUE,
                                      fontSize: 14
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Container(
                                padding: EdgeInsets.all(12),
                                child: Table(
                                  children: [
                                    TableRow(
                                      children: [
                                        Text("Country"),
                                        Text("Infected"),
                                        Text("Recovered"),
                                        Text("Dead"),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("China"),
                                        Text("1.7M"),
                                        Text("970K"),
                                        Text("3860"),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Country"),
                                        Text("Infected"),
                                        Text("Infected"),
                                        Text("Dead"),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Country"),
                                        Text("Country"),
                                        Text("Infected"),
                                        Text("Dead"),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Country"),
                                        Text("Country"),
                                        Text("Infected"),
                                        Text("Dead"),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Country"),
                                        Text("Infected"),
                                        Text("Infected"),
                                        Text("Dead"),
                                      ]
                                    ),

                                  ],
                                )
                            )
                          ],
                        )
                    )
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child:  Card(
                    elevation: 5,
                    child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "World Map",
                              style: TextStyle(
                                  color: AppColors.BLUE,
                                  fontSize: 14
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                                height: 144,
                                color: Colors.black12
                            )
                          ],
                        )
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

