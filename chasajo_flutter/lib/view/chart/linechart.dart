import 'dart:convert';
import 'dart:math';

// import 'package:chart_test_app/points/pricePoint.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget(double max, double min, {super.key});

  // final model;

  @override
  _chartpageState createState() => _chartpageState();
  // TODO: implement createState
}

class _chartpageState extends State<StatefulWidget> {
//Audi_A3.rds
  late List dogchart = [];
  late List<double> dateList = [];
  late List<double> priceList = [];
  late List<FlSpot> flList = [];
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  int num1 = 0;
  double k = 0;
  int myDouble = 0;
  int myDouble2 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(myDouble);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _asd(),
            builder: (context, snapshot) {
              if (snapshot.hasData == false) {
                return CircularProgressIndicator();
              } else {
                return Column(
                  children: [
                    Text(" 꺽은 선  차트"),
                    SizedBox(height: 30),
                    AspectRatio(
                      aspectRatio: 0.8,
                      child: LineChart(
                        LineChartData(
                          borderData: FlBorderData(
                              show: false,
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          backgroundColor: Color.fromARGB(255, 12, 1, 100),
                          minX: 2009,
                          maxX: 2021,
                          minY: 0,
                          maxY: 50000,
                          gridData: FlGridData(
                            show: false,

                            // getDrawingHorizontalLine: (value) {
                            //   return FlLine(
                            //     color: Color.fromARGB(255, 255, 255, 255),
                            //     strokeWidth: 0.5,
                            //   );
                            // },
                            // drawHorizontalLine: true,
                            // getDrawingVerticalLine: (value) {
                            //   return FlLine(
                            //     color: Color.fromARGB(255, 255, 255, 255),
                            //     strokeWidth: 0.5,
                            //   );
                            // },
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: flList,
                              isCurved: false,
                              //myDouble2 < 20000 ||
                              color: myDouble2 < 20000 && myDouble == 2017
                                  ? Colors.amber
                                  : Colors.green,
                              // gradientColors[0],
                              barWidth: 0,
                              dotData: FlDotData(show: true),
                              // belowBarData: BarAreaData(
                              //   show: true,
                              //   gradient: LinearGradient(
                              //     colors: [
                              //       const Color(0xff12c2e9).withOpacity(0.4),
                              //       const Color(0xffc471ed).withOpacity(0.4),
                              //       const Color(0xfff64f59).withOpacity(0.4),
                              //     ],
                              //   ),
                              // ),

                              // gradient: const LinearGradient(
                              //   colors: [
                              //     Color(0xff12c2e9),
                              //     Color(0xffc471ed),
                              //     Color(0xfff64f59),
                              //   ],
                              //   stops: [0.2, 0.5, 0.9],
                              // ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  } //

  Future<List> dogsizeSelect2() async {
    var url = Uri.parse('http://localhost:8080/carmodel/list/A3');
    var respnse = await http.get(url);
    // dogchart.clear();
    // Dweight.clear();
    // Ddate.clear();
    var dataConvertedJson2 = json.decode(utf8.decode(respnse.bodyBytes));
    dataConvertedJson2;

    return dataConvertedJson2;
  }

  Future<List> _asd() async {
    await dogsizeSelect2().then((value) {
      dogchart.addAll(value);
      //print(dogchart);
      for (int i = -1; i < dogchart.length - 1; i++) {
        num1 = (i + 1);
        // print(dogchart[num1]["years"]);
        myDouble = dogchart[num1]["year"];
        myDouble2 = dogchart[num1]["price"];
        // print(myDouble);
        // print(dogchart[num1]["years"]);
        dateList.add(myDouble.toDouble());
        priceList.add(myDouble2.toDouble());
        flList.add(FlSpot(myDouble.toDouble(), myDouble2.toDouble()));
      }
    });
    return dateList;
  }
} // end
