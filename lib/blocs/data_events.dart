import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();
}

class FetchCountriesData extends DataEvent {
  const FetchCountriesData();

  @override
  List<Object> get props => [];
}

class FetchCountryData extends DataEvent {
  const FetchCountryData();

  @override
  List<Object> get props => [];
}

class FetchFaqsData extends DataEvent {
  const FetchFaqsData();

  @override
  List<Object> get props => [];
}
