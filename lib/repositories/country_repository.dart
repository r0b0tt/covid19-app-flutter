import 'package:covid19/models/models.dart';
import 'package:covid19/repositories/data_api_client.dart';
import 'package:flutter/material.dart';

class CountryRepository {
  final DataApiClient dataApiClient;
  final String countryName;

  CountryRepository({@required this.dataApiClient, @required this.countryName})
      : assert(dataApiClient != null);

  Future<CountryModel> fetchCountry() async {
    return await dataApiClient.fetchCountry(countryName);
  }
}
