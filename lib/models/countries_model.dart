import 'package:equatable/equatable.dart';

class CountriesModel extends Equatable {
  final List countries;

  const CountriesModel({this.countries});

  @override
  List<Object> get props => [countries];

  static CountriesModel fromJson(dynamic json) {
    print(json['countries']);
    return CountriesModel(countries: json['countries']);
  }
}
