import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphChart extends StatelessWidget {

  List<FlSpot> lineBarSpots, lineBarSpots2;
  GraphChart(this.lineBarSpots, this.lineBarSpots2);

  static const String id = 'graph_chart';

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          backgroundColor: Colors.white,
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.black26,
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.black26,
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.black26, width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: lineBarSpots,
              colors: [Colors.redAccent],
              barWidth: 5,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: true, colors: [Colors.white10]),
            ),
            LineChartBarData(
              spots: lineBarSpots2,
              colors: [Colors.greenAccent],
              barWidth: 5,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: true, colors: [Colors.white10]),
            ),
          ],
        ),
      );
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 35,
          margin: 12,
        ),
      );
}