import 'dart:convert';

import 'package:covid19/models/home_model.dart';
import 'package:covid19/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class DataApiClient {
  final _baseUrl = 'https://covid19.mathdro.id/api';
  final _faqsUrl =
      'https://us-central1-terra-simple-apps.cloudfunctions.net/covid19-faqs-scraper';
  final Client httpClient;

  DataApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<HomeModel> fetchHomeData() async {
    final url = _baseUrl;
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception("An error occurred getting data.");
    }

    final json = jsonDecode(response.body);

    return HomeModel.fromJson(json);
  }

  Future<CountriesModel> fetchCountries() async {
    final url = "$_baseUrl/countries";
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception("An error occurred fetching countries");
    }

    final json = jsonDecode(response.body);

    return CountriesModel.fromJson(json);
  }

  Future<CountryModel> fetchCountry(String countryName) async {
    final url = "$_baseUrl/countries/$countryName";
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception("An error occurred fetching country data");
    }

    final json = jsonDecode(response.body);

    return CountryModel.fromJson(json);
  }

  Future<FaqsModel> fetchFaqs() async {
    final url = _faqsUrl;
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception("An error occurred fetching countries");
    }

    final json = jsonDecode(response.body);

    return FaqsModel.fromJson(json);
  }
}
