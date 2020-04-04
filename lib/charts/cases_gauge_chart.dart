import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GaugeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final String type;

  GaugeChart(this.seriesList, this.type, {this.animate});

  factory GaugeChart.withSampleData(String type) {
    return new GaugeChart(
      _createSampleData(type),
      type,
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: 14, startAngle: 8 / 5 * pi, arcLength: 2 * pi),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<GaugeSegment, String>> _createSampleData(
      String type) {
    final data = [
      new GaugeSegment('People', 1),
    ];

    return [
      new charts.Series<GaugeSegment, String>(
          id: 'Segments',
          domainFn: (GaugeSegment segment, _) => segment.segment,
          measureFn: (GaugeSegment segment, _) => segment.size,
          data: data,
          colorFn: (_, __) => type == "infected"
              ? charts.MaterialPalette.blue.shadeDefault
              : type == "recovered"
                  ? charts.MaterialPalette.green.shadeDefault
                  : charts.MaterialPalette.red.shadeDefault)
    ];
  }
}

class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}
