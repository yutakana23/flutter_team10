// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';

// class GraphChart extends StatelessWidget {
//   final ChartRepository repository = ChartRepository();
//   static const String id = 'graph_chart';
//   @override
//   Widget build(BuildContext context) {
//     return _lineChart();
//   }

//   Widget _lineChart() {
//     final List<charts.Series> seriesList = _series();
//     return new charts.LineChart(
//       seriesList,
//       animate: true,
//       defaultRenderer: new charts.LineRendererConfig(includePoints: true),
//     );
//   }

//   List<charts.Series<ShomaData, int>> _series() {
//     final data = repository.getSales();
//     return [
//       new charts.Series<ShomaData, int>(
//         id: 'sales',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (ShomaData sales, _) => sales.month,
//         measureFn: (ShomaData sales, _) => sales.score,
//         data: data,
//       )
//     ];
//   }
// }

// class ShomaData {
//   final int? month;
//   final int? score;
//   ShomaData(this.month, this.score);
// }

// class ChartRepository {
//   List<ShomaData> getSales() {
//     // Get from API
//     return [
//       new ShomaData(6, 46),
//       new ShomaData(8, 52),
//       new ShomaData(10, 68),
//       new ShomaData(12, 92)
//     ];
//   }
// }
