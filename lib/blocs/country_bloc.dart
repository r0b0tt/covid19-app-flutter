import 'package:covid19/blocs/data_events.dart';
import 'package:covid19/blocs/data_state.dart';
import 'package:covid19/models/models.dart';
import 'package:covid19/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryBloc extends Bloc<DataEvent, DataState> {
  final CountryRepository countryRepository;

  CountryBloc({@required this.countryRepository})
      : assert(countryRepository != null);

  @override
  // TODO: implement initialState
  DataState get initialState => DataEmpty();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is FetchCountryData) {
      yield DataLoading();
      try {
        final CountryModel countryModel =
            await countryRepository.fetchCountry();
        yield CountryLoaded(countryModel: countryModel);
      } catch (err) {
        print(err);
        yield DataError();
      }
    }
  }
}
