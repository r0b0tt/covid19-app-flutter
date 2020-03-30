import 'dart:convert';

import 'package:covid19/models/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class DataApiClient {
  final _baseUrl = 'https://covid19.mathdro.id/api';
  final Client httpClient;

  DataApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<HomeModel> fetchHomeData() async {
    final url = _baseUrl;
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception("An error occurred getting data.");
    }

    final json = jsonDecode(response.body);
    print(json);

    return HomeModel.fromJson(json);
  }
}
