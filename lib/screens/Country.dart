import 'package:covid19/assets/app_colors.dart';
import 'package:covid19/blocs/country_bloc.dart';
import 'package:covid19/blocs/data_events.dart';
import 'package:covid19/blocs/data_state.dart';
import 'package:covid19/charts/cases_gauge_chart.dart';
import 'package:covid19/components/loading_widget.dart';
import 'package:covid19/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Country extends StatelessWidget {
  final String countryName;
  final CountryRepository countryRepository;

  Country({@required this.countryName, @required this.countryRepository});

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
        child: Container(
          color: AppColors.GREY,
          child: BlocBuilder<CountryBloc, DataState>(
            builder: (context, state) {
              if (state is DataEmpty) {
                BlocProvider.of<CountryBloc>(context).add(FetchCountryData());
              }
              if (state is DataError) {
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
                            BlocProvider.of<CountryBloc>(context)
                                .add(FetchCountryData());
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
              if (state is CountryLoaded) {
                return ListView(
                  padding: EdgeInsets.all(16),
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            child: Padding(
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
                                    child:
                                        GaugeChart.withSampleData("infected"),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    state.countryModel.confirmed.toString(),
                                    style: patientsNumberStyle,
                                  ),
                                  SizedBox(height: 8),
                                  Text(""),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: Padding(
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
                                    child:
                                        GaugeChart.withSampleData("recovered"),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    state.countryModel.recovered.toString(),
                                    style: patientsNumberStyle,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    state.countryModel.recoveredPercentage,
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Deaths",
                                    style: cardTitleStyles,
                                  ),
                                  SizedBox(height: 12),
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: GaugeChart.withSampleData("dead"),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    state.countryModel.deaths.toString(),
                                    style: patientsNumberStyle,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    state.countryModel.deathPercentage,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return LoadingWidget(text: "Loading $countryName data...");
            },
          ),
        ),
      ),
    );
  }
}
