import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class CountryModel extends Equatable {
  final String confirmed;
  final String recovered;
  final String deaths;
  final recoveredPercentage;
  final deathPercentage;

  const CountryModel(
      {this.confirmed,
      this.recovered,
      this.deaths,
      this.recoveredPercentage,
      this.deathPercentage});

  @override
  List<Object> get props =>
      [confirmed, recovered, deaths, recoveredPercentage, deathPercentage];

  static CountryModel fromJson(dynamic json) {
    final numberFormat = NumberFormat.compact();
    var percentageFormat = new NumberFormat("#.00", "en_US");

    final int confirmed = json['confirmed']['value'];
    final int recovered = json['recovered']['value'];
    final int deaths = json['deaths']['value'];
    final String recoveredPercentage =
        percentageFormat.format((recovered / confirmed) * 100);
    final String deathPercentage =
        percentageFormat.format((deaths / confirmed) * 100);
    return CountryModel(
        confirmed: numberFormat.format(confirmed),
        recovered: numberFormat.format(recovered),
        deaths: numberFormat.format(deaths),
        recoveredPercentage: "$recoveredPercentage%",
        deathPercentage: "$deathPercentage%");
  }
}
