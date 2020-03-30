import 'package:covid19/models/models.dart';
import 'package:covid19/repositories/data_api_client.dart';
import 'package:flutter/material.dart';

class CountriesRepository {
  final DataApiClient dataApiClient;

  CountriesRepository({@required this.dataApiClient})
      : assert(dataApiClient != null);

  Future<CountriesModel> fetchCountries() async {
    return await dataApiClient.fetchCountries();
  }
}
