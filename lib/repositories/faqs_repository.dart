import 'package:covid19/models/models.dart';
import 'package:covid19/repositories/data_api_client.dart';
import 'package:flutter/material.dart';

class FaqsRepository {
  final DataApiClient dataApiClient;

  FaqsRepository({@required this.dataApiClient})
      : assert(dataApiClient != null);

  Future<FaqsModel> fetchFaqs() async {
    return await dataApiClient.fetchFaqs();
  }
}
