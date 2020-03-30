import 'package:covid19/blocs/data_events.dart';
import 'package:covid19/blocs/data_state.dart';
import 'package:covid19/models/models.dart';
import 'package:covid19/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesBloc extends Bloc<DataEvent, DataState> {
  final CountriesRepository countriesRepository;

  CountriesBloc({@required this.countriesRepository})
      : assert(countriesRepository != null);

  @override
  // TODO: implement initialState
  DataState get initialState => DataEmpty();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is FetchCountriesData) {
      yield DataLoading();
      try {
        final CountriesModel countriesModel =
            await countriesRepository.fetchCountries();
        yield CountriesLoaded(countriesModel: countriesModel);
      } catch (err) {
        print(err);
        yield DataError();
      }
    }
  }
}
