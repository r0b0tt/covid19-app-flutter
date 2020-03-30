import 'package:covid19/assets/app_colors.dart';
import 'package:covid19/blocs/countries_bloc.dart';
import 'package:covid19/blocs/data_events.dart';
import 'package:covid19/blocs/data_state.dart';
import 'package:covid19/components/TopNavBar.dart';
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
      create: (context) =>
          CountriesBloc(countriesRepository: countriesRepository),
      child: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              TopNavBar(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
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
                                    hintText: state.countriesModel.toString(),
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
                                    style: TextStyle(
                                        color: AppColors.BLUE, fontSize: 14),
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
                                        DataCell(GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Country()));
                                          },
                                          child: Text(
                                            "China",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blueAccent),
                                          ),
                                        )),
                                        DataCell(GestureDetector(
                                          onTap: () {
                                            print("Navigate");
                                          },
                                          child: Text("123,000"),
                                        )),
                                        DataCell(GestureDetector(
                                          onTap: () {
                                            print("Navigate");
                                          },
                                          child: Text("101,000"),
                                        )),
                                        DataCell(GestureDetector(
                                          onTap: () {
                                            print("Navigate");
                                          },
                                          child: Text("11,000"),
                                        )),
                                      ]),
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
                                          "China",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
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
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
