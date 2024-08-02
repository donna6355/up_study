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
          )
        ],
      ),
    );
  }
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
  {
    "date": "20240726",
    "chargersReport": [
      {
        "chargingSpeed": 3,
        "chargingCount": 285,
        "chargingSales": 858990,
        "chargingEnergy": 2863.29,
        "chargingTime": 1030788
      },
      {
        "chargingSpeed": 0,
        "chargingCount": 546,
        "chargingSales": 1643010,
        "chargingEnergy": 5476.69,
        "chargingTime": 1971612
      },
      {
        "chargingSpeed": 1,
        "chargingCount": 261,
        "chargingSales": 784020,
        "chargingEnergy": 2613.4,
        "chargingTime": 940824
      }
    ]
  },
  {
    "date": "20240727",
    "chargersReport": [
      {
        "chargingSpeed": 0,
        "chargingCount": 478,
        "chargingSales": 1432200,
        "chargingEnergy": 4774,
        "chargingTime": 1718640
      },
      {
        "chargingSpeed": 3,
        "chargingCount": 268,
        "chargingSales": 802050,
        "chargingEnergy": 2673.49,
        "chargingTime": 962460
      },
      {
        "chargingSpeed": 1,
        "chargingCount": 210,
        "chargingSales": 630150,
        "chargingEnergy": 2100.5,
        "chargingTime": 756180
      }
    ]
  },
  {
    "date": "20240728",
    "chargersReport": [
      {
        "chargingSpeed": 0,
        "chargingCount": 489,
        "chargingSales": 1470150,
        "chargingEnergy": 4900.47,
        "chargingTime": 1764180
      },
      {
        "chargingSpeed": 3,
        "chargingCount": 267,
        "chargingSales": 802500,
        "chargingEnergy": 2674.99,
        "chargingTime": 963000
      },
      {
        "chargingSpeed": 1,
        "chargingCount": 222,
        "chargingSales": 667650,
        "chargingEnergy": 2225.48,
        "chargingTime": 801180
      }
    ]
  },
  {
    "date": "20240729",
    "chargersReport": [
      {
        "chargingSpeed": 1,
        "chargingCount": 217,
        "chargingSales": 650220,
        "chargingEnergy": 2167.4,
        "chargingTime": 780264
      },
      {
        "chargingSpeed": 3,
        "chargingCount": 283,
        "chargingSales": 848370,
        "chargingEnergy": 2827.89,
        "chargingTime": 1018044
      },
      {
        "chargingSpeed": 0,
        "chargingCount": 500,
        "chargingSales": 1498590,
        "chargingEnergy": 4995.29,
        "chargingTime": 1798308
      }
    ]
  },
  {
    "date": "20240730",
    "chargersReport": [
      {
        "chargingSpeed": 0,
        "chargingCount": 531,
        "chargingSales": 1595820,
        "chargingEnergy": 5319.4,
        "chargingTime": 1914984
      },
      {
        "chargingSpeed": 3,
        "chargingCount": 276,
        "chargingSales": 831960,
        "chargingEnergy": 2773.2,
        "chargingTime": 998352
      },
      {
        "chargingSpeed": 1,
        "chargingCount": 255,
        "chargingSales": 763860,
        "chargingEnergy": 2546.19,
        "chargingTime": 916632
      }
    ]
  },
  {
    "date": "20240731",
    "chargersReport": [
      {
        "chargingSpeed": 1,
        "chargingCount": 223,
        "chargingSales": 666930,
        "chargingEnergy": 2223.1,
        "chargingTime": 800316
      },
      {
        "chargingSpeed": 0,
        "chargingCount": 502,
        "chargingSales": 1505070,
        "chargingEnergy": 5016.88,
        "chargingTime": 1806084
      },
      {
        "chargingSpeed": 3,
        "chargingCount": 279,
        "chargingSales": 838140,
        "chargingEnergy": 2793.79,
        "chargingTime": 1005768
      }
    ]
  },
  {
    "date": "20240801",
    "chargersReport": [
      {
        "chargingSpeed": 1,
        "chargingCount": 254,
        "chargingSales": 761490,
        "chargingEnergy": 2538.3,
        "chargingTime": 913788
      },
      {
        "chargingSpeed": 0,
        "chargingCount": 538,
        "chargingSales": 1614000,
        "chargingEnergy": 5380,
        "chargingTime": 1936800
      },
      {
        "chargingSpeed": 3,
        "chargingCount": 284,
        "chargingSales": 852510,
        "chargingEnergy": 2841.7,
        "chargingTime": 1023012
      }
    ]
  }
];
