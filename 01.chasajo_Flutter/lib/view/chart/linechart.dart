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

import '../../constants/colors.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  // final model;

  @override
  _chartpageState createState() => _chartpageState();
  // TODO: implement createState
}

class _chartpageState extends State<StatefulWidget> {
  late double touchedValue;
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);
  final Chart = Get.arguments ?? "_";

//Audi_A3.rds
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
  double min1 = 13;
  double max1 = 13;
  String carimage = '';
  // Chart[1];
  @override
  void initState() {
    // TODO: implement initState
    touchedValue = -1;
    setState(() {
      smodel = Chart[0];
      smileage = Chart[1];
      min1 = Chart[2];
      max1 = Chart[3];
      sbrand = Chart[5];
      carimage = Chart[6];
    });
    super.initState();
    // carchartaudi();
    // carchartaudi();
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
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              '$carimage',
              width: 200,
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$sbrand $smodel ',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: tPrimaryColor,
                  ),
                ),
                const Text(
                  'estimated price',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Min ',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                Text(
                  '$min1£  ',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: tPrimaryColor,
                  ),
                ),
                const Text(
                  'Max  ',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                Text(
                  '$max1£',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: tPrimaryColor,
                  ),
                ),
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
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(255, 12, 1, 100),
                                  minX: 2009,
                                  maxX: 2021,
                                  minY: 0,
                                  maxY: 50000,
                                  gridData: FlGridData(
                                    show: false,
                                  ),
                                  titlesData: FlTitlesData(
                                    bottomTitles: AxisTitles(
                                      sideTitles: _bottomTitles,
                                      axisNameWidget: const Text(
                                        'year(2000)',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: tPrimaryColor,
                                        ),
                                      ),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: _LeftSideTitles,
                                    ),
                                    topTitles: AxisTitles(
                                      axisNameWidget: const Text(
                                        'Price Distribution by Year',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: tPrimaryColor,
                                        ),
                                      ),
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                      showTitles: false,
                                    )),
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: flList,
                                      isCurved: false,
                                      //myDouble2 < 20000 ||
                                      color: myDouble2 < 20000 &&
                                              myDouble == 2017
                                          ? Colors.amber
                                          : Color.fromARGB(255, 204, 214, 1),

                                      barWidth: 0,
                                      dotData: FlDotData(show: true),
                                    ),
                                  ],
                                ),
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
          ],
        ),
      ),
    );
  } //

  SideTitles get _LeftSideTitles => SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = '0';
              break;
            case 10000:
              text = '10K';
              break;
            case 20000:
              text = '20K';
              break;
            case 30000:
              text = '30K';
              break;
            case 40000:
              text = '40k';
              break;
            case 50000:
              text = '50K';
              break;
          }

          return Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: tPrimaryColor,
            ),
          );
        },
      );

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 25,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 2010:
              text = '10';
              break;
            case 2011:
              text = '11';
              break;
            case 2012:
              text = '12';
              break;
            case 2013:
              text = '13';
              break;
            case 2014:
              text = '14';
              break;
            case 2015:
              text = '15';
              break;
            case 2016:
              text = '16';
              break;
            case 2017:
              text = '17';
              break;
            case 2018:
              text = '18';
              break;
            case 2019:
              text = '19';
              break;
            case 2020:
              text = '20';
              break;
          }

          return Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: tPrimaryColor,
            ),
          );
        },
      );

  Future<List> carchartaudi() async {
    var url = Uri.parse('http://localhost:8080/carmodel/list/$smodel');
    var respnse = await http.get(url);
    // dogchart.clear();
    // Dweight.clear();
    // Ddate.clear();
    var dataConvertedJson2 = json.decode(utf8.decode(respnse.bodyBytes));
    dataConvertedJson2;

    return dataConvertedJson2;
  }

  Future<List> carchartaudi2() async {
    var url = Uri.parse('http://localhost:8080/carmodel/VWlist/$smodel');
    var respnse = await http.get(url);
    // dogchart.clear();
    // Dweight.clear();
    // Ddate.clear();
    var dataConvertedJson2 = json.decode(utf8.decode(respnse.bodyBytes));
    dataConvertedJson2;

    return dataConvertedJson2;
  }

  Future<List> _asd() async {
    await carchartaudi().then((value) {
      dogchart.addAll(value);
      //print(dogchart);
      for (int i = -1; i < dogchart.length - 1; i++) {
        num1 = (i + 1);
        myDouble = dogchart[num1]["year"];
        myDouble2 = dogchart[num1]["price"];
        dateList.add(myDouble.toDouble());
        priceList.add(myDouble2.toDouble());
        flList.add(FlSpot(myDouble.toDouble(), myDouble2.toDouble()));
      }
    });
    await carchartaudi2().then((value) {
      dogchart.addAll(value);
      //print(dogchart);
      for (int i = -1; i < dogchart.length - 1; i++) {
        num1 = (i + 1);
        myDouble = dogchart[num1]["year"];
        myDouble2 = dogchart[num1]["price"];
        dateList.add(myDouble.toDouble());
        priceList.add(myDouble2.toDouble());
        flList.add(FlSpot(myDouble.toDouble(), myDouble2.toDouble()));
      }
    });
    return dateList;
  }
} // end  http://localhost:8080/carmodel/VWlist/Tiguan
