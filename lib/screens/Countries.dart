import 'package:covid19/blocs/countries_bloc.dart';
import 'package:covid19/blocs/data_events.dart';
import 'package:covid19/blocs/data_state.dart';
import 'package:covid19/repositories/data_api_client.dart';
import 'package:covid19/repositories/repository.dart';
import 'package:covid19/screens/Country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class Countries extends StatelessWidget {
  final CountriesRepository countriesRepository =
      CountriesRepository(dataApiClient: DataApiClient(httpClient: Client()));
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesBloc(
        countriesRepository: countriesRepository,
      ),
      child: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: BlocBuilder<CountriesBloc, DataState>(
                  builder: (context, state) {
                    if (state is DataEmpty) {
                      BlocProvider.of<CountriesBloc>(context)
                          .add(FetchCountriesData());
                    }
                    if (state is DataError) {
                      return Center(
                        child: Text("Error occurred!"),
                      );
                    }
                    if (state is CountriesLoaded) {
                      List<Widget> countries = [];
                      for (var country in state.countriesModel.countries) {
                        String countryName = country["name"];
                        String countryIso2 = country["iso2"];
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

                      return Column(
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
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
