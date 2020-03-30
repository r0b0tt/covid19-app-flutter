import 'package:covid19/models/models.dart';
import 'package:covid19/repositories/data_api_client.dart';
import 'package:flutter/cupertino.dart';

class HomeRepository {
  final DataApiClient dataApiClient;

  HomeRepository({@required this.dataApiClient})
      : assert(dataApiClient != null);

  Future<HomeModel> fetchHomeData() async {
    return await dataApiClient.fetchHomeData();
  }
}
