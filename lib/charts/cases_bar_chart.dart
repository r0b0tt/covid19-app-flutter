import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CasesBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CasesBarChart(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory CasesBarChart.withSampleData() {
    return new CasesBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<VirusData, String>> _createSampleData() {
    final infectedPeopleData = [
      new VirusData("Jan", 12000),
      new VirusData("Feb", 12000),
      new VirusData("Mar", 120000),
      new VirusData("Apr", 0),
      new VirusData("May", 0),
      new VirusData("Jun", 0),
      new VirusData("Jul", 0),
      new VirusData("Aug", 0),
      new VirusData("Sep", 0),
      new VirusData("Oct", 0),
      new VirusData("Nov", 0),
      new VirusData("Dec", 0),
    ];

    final recoveredPeopleData = [
      new VirusData('Jan', 10000),
      new VirusData('Feb', 50),
      new VirusData('Mar', 10),
      new VirusData("Apr", 0),
      new VirusData("May", 0),
      new VirusData("Jun", 0),
      new VirusData("Jul", 0),
      new VirusData("Aug", 0),
      new VirusData("Sep", 0),
      new VirusData("Oct", 0),
      new VirusData("Nov", 0),
      new VirusData("Dec", 0),
    ];

    final deadPeopleData = [
      new VirusData('Jan', 9000),
      new VirusData('Feb', 15),
      new VirusData('Mar', 50),
      new VirusData("Apr", 0),
      new VirusData("May", 0),
      new VirusData("Jun", 0),
      new VirusData("Jul", 0),
      new VirusData("Aug", 0),
      new VirusData("Sep", 0),
      new VirusData("Oct", 0),
      new VirusData("Nov", 0),
      new VirusData("Dec", 0),
    ];

    return [
      new charts.Series<VirusData, String>(
        id: 'Desktop',
        domainFn: (VirusData people, _) => people.month,
        measureFn: (VirusData people, _) => people.people,
        data: infectedPeopleData,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault.darker,
      ),
      new charts.Series<VirusData, String>(
        id: 'Tablet',
        domainFn: (VirusData people, _) => people.month,
        measureFn: (VirusData people, _) => people.people,
        data: recoveredPeopleData,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        fillColorFn: (_, __) =>
            charts.MaterialPalette.green.shadeDefault.darker,
      ),
      new charts.Series<VirusData, String>(
        id: 'Mobile',
        domainFn: (VirusData people, _) => people.month,
        measureFn: (VirusData people, _) => people.people,
        data: deadPeopleData,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.darker,
      ),
    ];
  }
}

/// Sample ordinal data type.
class VirusData {
  final String month;
  final int people;

  VirusData(this.month, this.people);
}
