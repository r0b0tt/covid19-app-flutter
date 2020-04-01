import 'package:covid19/assets/app_colors.dart';
import 'package:covid19/blocs/country_bloc.dart';
import 'package:covid19/blocs/data_events.dart';
import 'package:covid19/blocs/data_state.dart';
import 'package:covid19/cases_bar_chart.dart';
import 'package:covid19/cases_gauge_chart.dart';
import 'package:covid19/repositories/data_api_client.dart';
import 'package:covid19/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class Country extends StatelessWidget {
  final String countryName;

  Country({@required this.countryName});

  final CountryRepository countryRepository = CountryRepository(
    countryName: "Kenya",
    dataApiClient: DataApiClient(
      httpClient: Client(),
    ),
  );

  static const cardTitleStyles = TextStyle(color: AppColors.BLUE, fontSize: 14);
  static const patientsNumberStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryName),
      ),
      body: BlocProvider(
        create: (context) => CountryBloc(countryRepository: countryRepository),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            BlocBuilder<CountryBloc, DataState>(
              builder: (context, state) {
                if (state is DataEmpty) {
                  BlocProvider.of<CountryBloc>(context).add(FetchCountryData());
                }
                if (state is DataError) {
                  return Center(
                    child: Text("An error occurred!"),
                  );
                }
                if (state is CountryLoaded) {
                  return Column(
                    children: <Widget>[
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
                                          child: GaugeChart.withSampleData(
                                              "infected"),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          state.countryModel.confirmed,
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
                                          child: GaugeChart.withSampleData(
                                              "recovered"),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          state.countryModel.recovered,
                                          style: patientsNumberStyle,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          state
                                              .countryModel.recoveredPercentage,
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
                                          child:
                                              GaugeChart.withSampleData("dead"),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          state.countryModel.deaths,
                                          style: patientsNumberStyle,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          state.countryModel.deathPercentage,
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Locations",
                                          style: TextStyle(
                                              color: AppColors.BLUE,
                                              fontSize: 14),
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
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
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
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
