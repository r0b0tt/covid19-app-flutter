import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
      barGroupingType: charts.BarGroupingType.stacked,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<VirusData, String>> _createSampleData() {
    final desktoppeopleData = [
      new VirusData("Jan", 12000),
      new VirusData("Feb", 12000),
      new VirusData("Mar", 120000),
      new VirusData("April", 0)
    ];

    final tablepeopleData = [
      new VirusData('Jan', 10000),
      new VirusData('Feb', 50),
      new VirusData('Mar', 10),
      new VirusData('April', 20),
    ];

    final mobilepeopleData = [
      new VirusData('Jan', 10),
      new VirusData('Feb', 15),
      new VirusData('Mar', 50),
      new VirusData('April', 45),
    ];

    return [
      new charts.Series<VirusData, String>(
        id: 'Desktop',
        domainFn: (VirusData people, _) => people.month,
        measureFn: (VirusData people, _) => people.people,
        data: desktoppeopleData,
      ),
      new charts.Series<VirusData, String>(
        id: 'Tablet',
        domainFn: (VirusData people, _) => people.month,
        measureFn: (VirusData people, _) => people.people,
        data: tablepeopleData,
      ),
      new charts.Series<VirusData, String>(
        id: 'Mobile',
        domainFn: (VirusData people, _) => people.month,
        measureFn: (VirusData people, _) => people.people,
        data: mobilepeopleData,
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