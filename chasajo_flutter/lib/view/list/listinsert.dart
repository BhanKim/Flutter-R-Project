import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class InsertCar extends StatefulWidget {
  const InsertCar({super.key});

  @override
  State<InsertCar> createState() => _InsertCarState();
}

class _InsertCarState extends State<InsertCar> {
  final List<double> values = [];
  final List<double> enginvalues = [];
  late int selectedItem = 0;
  //  rds 넣을 친구들.
  late List<int> years = [];
  late double mileage = 0;
  late int year = 0;
  late int mpg = 0;
  late List<int> mpgs = [];
  late double engineSize = 0;
  late String Manual = '';
  late String fuelType_D = '';
  late String fuelType_p = '';
  //
  String result = '';
  int _currentSliderValue = 0;
  int _enginSliderValue = 0;
  // for문 돌리려고 만든거.
  double num1 = 0;
  double enginnum1 = 0;
  int yearsCount = 0;
  int mpgsCount = 0;
  // 최소 최고치 계산 if 문
  late List<double> minresult = [];
  late List<double> maxresult = [];
  double min = 0;
  double max = 0;
  int moo = 0;
  int result2 = 0;
  bool value = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Mile values for
    for (int i = 0; i < 21; i++) {
      num1 = (i * 0.5);
      num1 = num1 * 10000;
      values.add(num1);
    }

    // enginvalues values for
    for (int i = 0; i < 10; i++) {
      enginnum1 = (i * 0.5);
      // num1 =;
      enginvalues.add(enginnum1);
    }
    // years values for
    for (int i = 2012; i < 2020; i++) {
      yearsCount = i + 1;
      years.add(yearsCount);
    }

    for (int i = 1; i < 7; i++) {
      mpgsCount = i;
      mpgsCount = mpgsCount * 10;
      mpgs.add(mpgsCount);
    }
  }

//Manual     fuelType_D     fuelType_p
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('insert Car'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
            child: Text(''),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: CupertinoPicker(
                  itemExtent: 30,
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  onSelectedItemChanged: (value) {
                    setState(() {
                      year = value;
                      // print(years[year]);
                      year = years[year];
                    });
                  },
                  children: [
                    Text("${years[0]}"),
                    Text("${years[1]}"),
                    Text("${years[2]}"),
                    Text("${years[3]}"),
                    Text("${years[4]}"),
                    Text("${years[5]}"),
                    Text("${years[6]}"),
                    Text("${years[7]}"),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (values[_currentSliderValue]).toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 7,
              ),
              const Text(
                "Mile",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Slider(
            value: _currentSliderValue.toDouble(),
            label: values[_currentSliderValue].toString(),
            min: 0,
            max: values.length - 1,
            divisions: values.length - 1,
            activeColor: Colors.blue.shade700,
            inactiveColor: Colors.blue.shade100,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value.toInt();
                mileage = values[_currentSliderValue];
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (enginvalues[_enginSliderValue]).toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 7,
              ),
              const Text(
                "enginsize",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Slider(
            value: _enginSliderValue.toDouble(),
            label: enginvalues[_enginSliderValue].toString(),
            min: 0,
            max: enginvalues.length - 1,
            divisions: enginvalues.length - 1,
            activeColor: Color.fromARGB(255, 25, 210, 185),
            inactiveColor: Color.fromARGB(255, 187, 251, 243),
            onChanged: (double enginvalues) {
              setState(() {
                _enginSliderValue = enginvalues.toInt();
                engineSize = _enginSliderValue / 2;
              });
            },
          ),
          CupertinoPicker(
            itemExtent: 30,
            scrollController: FixedExtentScrollController(initialItem: 0),
            onSelectedItemChanged: (value) {
              setState(() {
                mpg = value;

                mpg = mpgs[mpg];
              });
            },
            children: [
              Text("${mpgs[0]}"),
              Text("${mpgs[1]}"),
              Text("${mpgs[2]}"),
              Text("${mpgs[3]}"),
              Text("${mpgs[4]}"),
              Text("${mpgs[5]}"),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          // CupertinoSwitch(
          //     value: value,
          //     onChanged: (value) {
          //       if (value == true) {
          //         value == false;
          //       } else {
          //         value == true;
          //       }
          //     }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                borderRadius: BorderRadius.circular(16.0),
                color: Color.fromARGB(255, 0, 165, 151),
                child: const Text(
                  'Manual',
                ),
                onPressed: () {
                  Manual = "TRUE";

                  print(Manual);
                },
              ),
              CupertinoButton(
                borderRadius: BorderRadius.circular(16.0),
                color: Color.fromARGB(255, 0, 94, 255),
                child: const Text('Automatic'),
                onPressed: () {
                  Manual = "FALSE";

                  print(Manual);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                borderRadius: BorderRadius.circular(16.0),
                color: Color.fromARGB(255, 0, 165, 151),
                child: const Text('Diesel'),
                onPressed: () {
                  fuelType_D = "TRUE";
                },
              ),
              CupertinoButton(
                borderRadius: BorderRadius.circular(16.0),
                color: Color.fromARGB(255, 0, 94, 255),
                child: const Text('NOT Diesel'),
                onPressed: () {
                  fuelType_D = "FALSE";
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                borderRadius: BorderRadius.circular(16.0),
                color: Color.fromARGB(255, 0, 165, 151),
                child: const Text('Petrol'),
                onPressed: () {
                  fuelType_p = "TRUE";
                },
              ),
              CupertinoButton(
                borderRadius: BorderRadius.circular(16.0),
                color: Color.fromARGB(255, 0, 94, 255),
                child: const Text('NOT Petrol'),
                onPressed: () {
                  fuelType_p = "FALSE";
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Getjasondata();
            },
            child: const Text('예측!'),
          ),
          Text('${result2}')
        ],
      ),
    );
  }

  /// fucntion

  // desc 예측을 위한 피쳐 컬럼 값  입력.
  // date 2023.01.09
  Getjasondata() async {
    var url = Uri.parse(
        "http://localhost:8080/urlcar?year=$year&mileage=$mileage&engineSize=$engineSize" +
            "&mpg=$mpg&Manual=$Manual&fuelType_D=$fuelType_D&fuelType_p=$fuelType_p");

    var response = await http.get(url);
    var dataConvertedJson = json.decode(
      utf8.decode(response.bodyBytes),
    );
    result = dataConvertedJson["result"];
    // print(int.parse(result));
    result2 = int.parse(result);
    setState(() {
      _showDialig(context, result);
      minresult = [14650, 7490, 15470, 8490, 4290, 9690];
      maxresult = [29490, 20450, 36990, 29991, 16950, 22995];
      for (int i = -1; i < 6; i++) {
        moo = i + 1;
        if (result2 == moo) {
          moo = moo - 1;
          min = minresult[moo];
          max = maxresult[moo];
        }
      }
    });
  }

  _showDialig(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('가격 예측 결과'),
          content: Text('입력하신 모델의 최소 가격은 $min£ ~ 최대 가격은 $max£ 입니다..'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  //
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}
