import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();
}

class FetchCountriesData extends DataEvent {
  const FetchCountriesData();

  @override
  List<Object> get props => [];
}
