import 'package:covid19/assets/app_colors.dart';
import 'package:covid19/blocs/countries_bloc.dart';
import 'package:covid19/blocs/data_events.dart';
import 'package:covid19/blocs/data_state.dart';
import 'package:covid19/components/loading_widget.dart';
import 'package:covid19/repositories/data_api_client.dart';
import 'package:covid19/repositories/repository.dart';
import 'package:covid19/screens/Country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  String countrySearchString = "";

  final CountriesRepository countriesRepository =
      CountriesRepository(dataApiClient: DataApiClient(httpClient: Client()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesBloc(
        countriesRepository: countriesRepository,
      ),
      child: Container(
        color: AppColors.GREY,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Expanded(child: Container(
              child: BlocBuilder<CountriesBloc, DataState>(
                builder: (context, state) {
                  if (state is DataEmpty) {
                    BlocProvider.of<CountriesBloc>(context)
                        .add(FetchCountriesData());
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
                                BlocProvider.of<CountriesBloc>(context)
                                    .add(FetchCountriesData());
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
                  if (state is CountriesLoaded) {
                    List<Widget> countries = [];

                    for (var country in state.countriesModel.countries) {
                      String countryName = country["name"];
                      String countryIso2 = country["iso2"];
                      if (countryName
                          .toLowerCase()
                          .contains(countrySearchString.toLowerCase())) {
                        countries.add(
                          GestureDetector(
                            onTap: () {
                              final CountryRepository countryRepository =
                                  CountryRepository(
                                countryName: countryName,
                                dataApiClient: DataApiClient(
                                  httpClient: Client(),
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Country(
                                    countryName: countryName,
                                    countryRepository: countryRepository,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Image.network(
                                        'https://www.countryflags.io/$countryIso2/shiny/64.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      countryName,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: TextField(
                              onChanged: (string) {
                                setState(() {
                                  countrySearchString = string;
                                });
                              },
                              maxLines: 1,
                              decoration: InputDecoration(
                                  hintText: "Search Country",
                                  fillColor: Colors.green),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            children: countries,
                          ),
                        ),
                      ],
                    );
                  }
                  return LoadingWidget(
                    text: "Loading Countries",
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
