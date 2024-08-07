import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartTest extends StatefulWidget {
  const ChartTest({super.key});

  @override
  State<ChartTest> createState() => _ChartTestState();
}

class _ChartTestState extends State<ChartTest> {
  int pieIdx = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              width: 300,
              height: 300,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (event, response) {
                      if (response == null) return;
                      if (response.touchedSection?.touchedSectionIndex == -1)
                        return;
                      print(
                          'touch event : ${event.isInterestedForInteractions}');
                      print(
                          'touch response : ${response?.touchedSection?.touchedSectionIndex}');
                      setState(() {
                        pieIdx =
                            response.touchedSection?.touchedSectionIndex ?? -1;
                      });
                    },
                  ),
                  centerSpaceRadius: 0,
                  sections: [
                    PieChartSectionData(
                      radius: 150,
                      value: mockPieJson["reportedCnt"]! /
                          mockPieJson["faultCnt"]!,
                      color: pieIdx == 0
                          ? Colors.amber
                          : Colors.amber.withOpacity(0.5),
                      title:
                          "신고 접수${pieIdx == 0 ? '\n${mockPieJson["reportedCnt"]!}건' : ''}",
                      titleStyle: whiteText,
                    ),
                    PieChartSectionData(
                      radius: 150,
                      value: mockPieJson["inProgressCnt"]! /
                          mockPieJson["faultCnt"]!,
                      color: pieIdx == 1
                          ? Colors.blue
                          : Colors.blue.withOpacity(0.5),
                      title:
                          "처리 중${pieIdx == 1 ? '\n${mockPieJson["inProgressCnt"]!}건' : ''}",
                      titleStyle: whiteText,
                    ),
                    PieChartSectionData(
                      radius: 150,
                      value: mockPieJson["resolvedCnt"]! /
                          mockPieJson["faultCnt"]!,
                      color: pieIdx == 2
                          ? Colors.purple
                          : Colors.purple.withOpacity(0.5),
                      title:
                          "처리 완료${pieIdx == 2 ? '\n${mockPieJson["resolvedCnt"]!}건' : ''}",
                      titleStyle: whiteText,
                    ),
                    PieChartSectionData(
                      radius: 150,
                      value: mockPieJson["confirmedCnt"]! /
                          mockPieJson["faultCnt"]!,
                      color: Colors.green,
                      title: "확인 완료",
                      titleStyle: whiteText,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 800,
              height: 300,
              child: BarChart(
                BarChartData(
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipPadding: EdgeInsets.symmetric(horizontal: 4),
                      getTooltipColor: (_) => Colors.black45,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) =>
                          BarTooltipItem(rod.toY.toString(), whiteText),
                    ),
                  ),
                  maxY: 14,
                  barGroups: mockBarJson
                      .map((element) => _generateBarData(
                          x: element["date"]!,
                          val1: element["slow"]!.toDouble(),
                          val2: element["fast"]!.toDouble()))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

BarChartGroupData _generateBarData({
  required int x,
  required double val1,
  required double val2,
}) {
  return BarChartGroupData(
    x: x,
    groupVertically: true,
    showingTooltipIndicators: [0],
    barRods: [
      BarChartRodData(
        toY: val1 + val2,
        width: 50,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        rodStackItems: [
          BarChartRodStackItem(
            val1,
            val1 + val2,
            Colors.blue,
          ),
          BarChartRodStackItem(
            0,
            val1,
            Colors.green,
          ),
        ],
      ),
    ],
  );
}

const whiteText = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

const mockPieJson = {
  "faultCnt": 3,
  "reportedCnt": 1,
  "confirmedCnt": 0,
  "inProgressCnt": 1,
  "resolvedCnt": 1
};

const mockBarJson = [
  {"date": 0701, "slow": 5, "fast": 7},
  {"date": 0702, "slow": 4, "fast": 1},
  {"date": 0703, "slow": 3, "fast": 2},
  {"date": 0704, "slow": 5, "fast": 4},
];
