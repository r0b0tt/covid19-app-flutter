import 'package:covid19/assets/app_colors.dart';
import 'package:covid19/blocs/home_bloc.dart';
import 'package:covid19/blocs/home_event.dart';
import 'package:covid19/blocs/home_state.dart';
import 'package:covid19/components/loading_widget.dart';
import 'package:covid19/repositories/data_api_client.dart';
import 'package:covid19/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class Home extends StatelessWidget {
  final HomeRepository homeRepository =
      HomeRepository(dataApiClient: DataApiClient(httpClient: Client()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(homeRepository: homeRepository),
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  static const cardTitleStyles = TextStyle(color: AppColors.BLUE, fontSize: 14);
  static const patientsNumberStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeEmpty) {
        BlocProvider.of<HomeBloc>(context).add(FetchHomeData());
      }
      if (state is HomeError) {
        return Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 36,
                ),
                SizedBox(height: 8),
                Text(
                  "An error occurred",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                RaisedButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(FetchHomeData());
                  },
                  child: Text(
                    "Try Again",
                  ),
                )
              ],
            ),
          ),
        );
      }
      if (state is HomeLoaded) {
        return Container(
          color: AppColors.GREY,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              // World Cases
              Card(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "World Cases",
                        style: cardTitleStyles,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Infected",
                                  style: cardTitleStyles,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  state.homeModel.confirmed.toString(),
                                  style: patientsNumberStyle,
                                ),
                                SizedBox(height: 8),
                                Text(""),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Recovered",
                                  style: cardTitleStyles,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  state.homeModel.recovered.toString(),
                                  style: patientsNumberStyle,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  state.homeModel.recoveredPercentage,
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Deaths",
                                  style: cardTitleStyles,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  state.homeModel.deaths.toString(),
                                  style: patientsNumberStyle,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  state.homeModel.deathPercentage,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),

              // Prevention
              Card(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Prevention",
                        style: cardTitleStyles,
                      ),
                      SizedBox(height: 24),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.5,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 24,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/stay-home.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'STAY',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' home'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/distance.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'KEEP',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' a safe distance'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/hand-wash.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'WASH',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' hands often'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/cough.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'COVER',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' your cough'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/call-center.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'SICK?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' call ahead'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                height: 72,
                                image: AssetImage(
                                  'assets/images/government.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'FOLLOW',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' instructions'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Card(
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Most Affected Countries",
                          style: TextStyle(
                            color: AppColors.BLUE,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
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
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("123,000")),
                                DataCell(Text("101,000")),
                                DataCell(Text("11,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "Italy",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("101,000")),
                                DataCell(Text("56,000")),
                                DataCell(Text("5,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "USA",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("97,000")),
                                DataCell(Text("48,000")),
                                DataCell(Text("1,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "South Korea",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("88,000")),
                                DataCell(Text("20,000")),
                                DataCell(Text("3,000")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "Mexico",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                                DataCell(Text("56,000")),
                                DataCell(Text("36,000")),
                                DataCell(Text("500")),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        );
      }
      return LoadingWidget();
    });
  }
}
