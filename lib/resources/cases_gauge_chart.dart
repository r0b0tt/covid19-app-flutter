import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GaugeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final String type;

  GaugeChart(this.seriesList,this.type, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory GaugeChart.withSampleData(String type) {
    return new GaugeChart(
      _createSampleData(type),
      type,
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 30px. The remaining space in
        // the chart will be left as a hole in the center. Adjust the start
        // angle and the arc length of the pie so it resembles a gauge.
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 10, startAngle: 8 / 5 * pi, arcLength: 2 * pi));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<GaugeSegment, String>> _createSampleData(
      String type) {
    final data = [
      new GaugeSegment('People', 75),
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

/// Sample data type.
class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}
