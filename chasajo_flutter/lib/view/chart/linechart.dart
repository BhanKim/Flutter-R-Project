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
  const LineChartWidget({super.key});

  // final model;

  @override
  _chartpageState createState() => _chartpageState();
  // TODO: implement createState
}

class _chartpageState extends State<StatefulWidget> {
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);

//Audi_A3.rds
  var Chart = Get.arguments ?? "_";
  late List dogchart = [];
  late List<double> dateList = [];
  late List<double> priceList = [];
  late List<FlSpot> flList = [];
  late List<BarChartGroupData> barchart = [];
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  int num1 = 0;
  double k = 0;
  int myDouble = 0;
  int myDouble2 = 0;
  String smodel = '';
  String sbrand = '';
  double smileage = 0;
  double min1 = 0;
  double max1 = 0;
  // Chart[1];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    smodel = Chart[0];
    smileage = Chart[1];
    min1 = Chart[2];
    max1 = Chart[3];
    sbrand = Chart[5];
    dogsizeSelect2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('chart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'images/$sbrand$smodel.png',
              width: 300,
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$sbrand $smodel의 예상 가격 은 '),
                Text('$min1£'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$sbrand $smodel의 예상 가격 은 '),
                Text('$max1£'),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: _asd(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) {
                      return const CircularProgressIndicator();
                    } else {
                      return Column(
                        children: [
                          const SizedBox(height: 30),
                          SizedBox(
                            width: 400,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: LineChart(
                                LineChartData(
                                  borderData: FlBorderData(
                                      show: false,
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 1.0,
                                          style: BorderStyle.solid)),
                                  backgroundColor:
                                      const Color.fromARGB(255, 12, 1, 100),
                                  minX: 2009,
                                  maxX: 2021,
                                  minY: 0,
                                  maxY: 50000,
                                  gridData: FlGridData(
                                    show: false,
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: flList,
                                      isCurved: false,
                                      //myDouble2 < 20000 ||
                                      color:
                                          myDouble2 < 20000 && myDouble == 2017
                                              ? Colors.amber
                                              : Colors.green,

                                      barWidth: 0,
                                      dotData: FlDotData(show: true),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 400,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: BarChart(
                                BarChartData(
                                  borderData: FlBorderData(
                                      border: const Border(
                                    top: BorderSide.none,
                                    right: BorderSide.none,
                                    left: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1),
                                  )),
                                  groupsSpace: 10,
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  barGroups: barchart,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } //

  Future<List> dogsizeSelect2() async {
    var url = Uri.parse(
        'http://localhost:8080/carmodel/list/$smodel?smileage=$smileage');
    var respnse = await http.get(url);
    // dogchart.clear();
    // Dweight.clear();
    // Ddate.clear();
    var dataConvertedJson2 = json.decode(utf8.decode(respnse.bodyBytes));
    dataConvertedJson2;
    print(dataConvertedJson2);

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
        barchart
            .add(BarChartGroupData(x: myDouble - 2000, barsSpace: 2, barRods: [
          BarChartRodData(
            toY: myDouble2.toDouble(),
            // rodStackItems: [BarChartRodStackItem(0, myDouble2.toDouble(), dark)],
            // borderRadius: BorderRadius.zero,
          )
        ]));
      }
    });
    return dateList;
  }
} // end
