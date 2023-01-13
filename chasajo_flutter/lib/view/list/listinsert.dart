import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:cha_sa_jo_flutter/constants/colors.dart';
import 'package:cha_sa_jo_flutter/widget/carlist/MessageCol.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:toggle_switch/toggle_switch.dart';

import '../../widget/carlist/Collection.dart';
import '../chart/linechart.dart';
import 'C.select.dart';

class InsertCar extends StatefulWidget {
  final brand;
  final model;
  final carimage;
  const InsertCar({super.key, this.brand, this.model, this.carimage});

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
  late String Manual = 'TRUE';
  late String fuelType_D = 'TRUE';
  late String fuelType_p = 'FALSE';
  late bool actionSiwtchD = true;
  late bool actionSiwtchP = true;
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
  late double min = 0;
  late double max = 0;
  int moo = 0;
  int result2 = 0;
  bool value = true;

  /// mysql insert  /// int sseq = 0;
  String sid = '';
  String sbrand = '';
  String smodel = '';
  String carimage = '';
  String stransmission = 'Diesel';
  String sfueltype = 'Menual';
  int smileage = 0;
  double smpg = 10;
  // int syear = 0;
  double senginesize = 0;
  //user id불러오기
  final user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> userData = {};
  String username = '';
  String fileName = 'Audi_A3.rds';
  List priceResult = [];
  double test2 = 0;

//sseq sid sbrand smodel stransmission
//sfueltype smileage smpg syear senginesize
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sbrand = '${widget.brand}';
    smodel = '${widget.model}';
    carimage = '${widget.carimage}';
    fileName = '${sbrand}_${smodel}.rds';
    // Mile values for
    for (int i = 1; i < 21; i++) {
      num1 = (i * 0.5);
      num1 = num1 * 10000;
      values.add(num1);
    }

    // enginvalues values for
    for (int i = 1; i < 10; i++) {
      enginnum1 = ((i * 500) + 500);
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

  Future<void> _sendMessage() async {
    FocusScope.of(context).unfocus();
    final docRef = FirebaseFirestore.instance.collection("user").doc(user!.uid);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        userData = doc.data() as Map<String, dynamic>;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

//Manual     fuelType_D     fuelType_p
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _sendMessage(),
      builder: (context, snapshot) {
        return Scaffold(
          body: Column(
            children: [
              Image.asset(
                '$carimage',
                width: 200,
                height: 120,
              ),
              const SizedBox(
                height: 10,
                child: Text(''),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: CupertinoPicker(
                      itemExtent: 30,
                      scrollController:
                          FixedExtentScrollController(initialItem: 0),
                      onSelectedItemChanged: (value) {
                        setState(() {
                          year = value;
                          // (years[year]);
                          year = years[year];
                        });
                      },
                      children: [
                        Text("${years[0]} year"),
                        Text("${years[1]} year"),
                        Text("${years[2]} year"),
                        Text("${years[3]} year"),
                        Text("${years[4]} year"),
                        Text("${years[5]} year"),
                        Text("${years[6]} year"),
                        Text("${years[7]} year"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
              SizedBox(
                width: 350,
                child: Slider(
                  value: _currentSliderValue.toDouble(),
                  label: values[_currentSliderValue].toString(),
                  min: 0,
                  max: values.length - 1,
                  divisions: values.length - 1,
                  activeColor: tPrimaryColor,
                  inactiveColor: Colors.blue.shade200,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value.toInt();
                      mileage = values[_currentSliderValue];
                    });
                  },
                ),
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
              SizedBox(
                width: 350,
                child: Slider(
                  value: _enginSliderValue.toDouble(),
                  label: enginvalues[_enginSliderValue].toString(),
                  min: 0,
                  max: enginvalues.length - 1,
                  divisions: enginvalues.length - 1,
                  activeColor: Colors.indigoAccent.shade200,
                  inactiveColor: Colors.indigoAccent.shade100,
                  onChanged: (double enginvalues) {
                    setState(() {
                      _enginSliderValue = enginvalues.toInt();
                      engineSize = _enginSliderValue / 2;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 350,
                child: CupertinoPicker(
                  itemExtent: 30,
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  onSelectedItemChanged: (value) {
                    setState(() {
                      mpg = value;
                      mpg = mpgs[mpg];
                    });
                  },
                  children: [
                    Text("${mpgs[0]} mpg"),
                    Text("${mpgs[1]} mpg"),
                    Text("${mpgs[2]} mpg"),
                    Text("${mpgs[3]} mpg"),
                    Text("${mpgs[4]} mpg"),
                    Text("${mpgs[5]} mpg"),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ToggleSwitch(
                customWidths: const [160.0, 160.0],
                cornerRadius: 20.0,
                activeBgColors: const [
                  [tPrimaryColor],
                  [tPrimaryColor]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                labels: const ['Manual', 'Auto'],
                icons: const [null, null],
                onToggle: (index) {
                  if (index == 1) {
                    //ture = manual, false = auto
                    Manual = "FALSE";
                  } else if (index == 0) {
                    Manual = "TRUE";
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              ToggleSwitch(
                customWidths: const [160.0, 160.0],
                cornerRadius: 20.0,
                activeBgColors: const [
                  [tPrimaryColor],
                  [tPrimaryColor]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                labels: const ['Diesel', 'Petrol'],
                icons: const [null, null],
                onToggle: (index) {
                  if (index == 1) {
                    fuelType_D = "FALSE";
                    fuelType_p = "TRUE";
                    actionSiwtchP = false;
                  } else if (index == 0) {
                    fuelType_D = "TRUE";
                    fuelType_p = "FALSE";
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 85,
                    child: ElevatedButton(
                        onPressed: () {
                          // sbrand = '${widget.brand}';
                          // smodel = '${widget.model}';
                          if (fuelType_D == "TRUE") {
                            stransmission = "Diesel";
                          } else if (fuelType_D == "FALSE") {
                            stransmission = "Petrol";
                          }
                          if (Manual == "TRUE") {
                            sfueltype = "Menual";
                          } else if (Manual == "FALSE") {
                            sfueltype = "Autometic";
                          }
                          carinsert(userData['email']);
                          minMax();
                          // if (actionSiwtchP == false) {
                          //   // GetRds();
                          //   carinsert(userData['email']);

                          //   minMax();
                          // } else {
                          //   _inputcheck(context);
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tPrimaryColor,
                        ),
                        child: const Text('예측!')),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, MaterialPageRoute(
                          builder: (context) {
                            return Collection();
                          },
                        ));
                      },
                      child: const Text('돌아가기'))
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /// fucntion
  // GetRds() {
  //   var url = Uri.parse('http://localhost:8080/show_rds?name=$fileName');
  // }

  // desc 예측을 위한 피쳐 컬럼 값  입력.
  // date 2023.01.09
  Future<int> Getjasondata() async {
    var enginSizeCC = engineSize + 1;
    print(year);
    print(mileage);
    print(enginSizeCC);
    print(mpg);
    print(Manual);
    print(fuelType_D);
    print(fuelType_p);
    print(fileName);
    var url = Uri.parse(
        "http://localhost:8080/urlcar?year=$year&mileage=$mileage&engineSize=$enginSizeCC"
        "&mpg=$mpg&Manual=$Manual&fuelType_D=$fuelType_D&fuelType_p=$fuelType_p&fileName=$fileName");
//&fileName=$fileName
    var response = await http.get(url);
    var dataConvertedJson = json.decode(
      utf8.decode(response.bodyBytes),
    );
    result = dataConvertedJson["result"];
    result2 = int.parse(result);
    return result2;
  }

  minMax() async {
    await Getjasondata().then(
      (value) {
        // sleep(Duration(seconds: 2));
        setState(
          () {
            if (fileName == "Audi_A3.rds") {
              minresult = [14650, 7490, 15470, 8490, 4290, 9690];
              maxresult = [29490, 20450, 36990, 29991, 16950, 22995];
            }
            if (fileName == "Audi_A4.rds") {
              minresult = [10990, 13495, 9000, 17998, 12300, 11490, 8999, 5995];
              maxresult = [
                27600,
                28995,
                16950,
                47990,
                26495,
                18990,
                18990,
                12995
              ];
            }
            //6

            if (fileName == "Audi_Q3.rds") {
              minresult = [
                20995,
                23995,
                12998,
                13490,
                12999,
                15480,
                25995,
                8750
              ];
              maxresult = [
                43990,
                37990,
                21795,
                26200,
                21000,
                26325,
                38990,
                19712
              ];
            }
            if (fileName == "BMW_1_Series.rds") {
              minresult = [7490, 8290, 11995, 12491, 7500, 13750, 3350];
              maxresult = [19490, 23450, 38555, 31723, 20990, 28875, 14490];
            }
            for (int i = -1; i < 6; i++) {
              moo = i + 1;
              if (result2 == moo) {
                moo = moo - 1;
                min = minresult[moo];
                max = maxresult[moo];
              }
            }
            priceResult.add(min);
            priceResult.add(max);
            Get.to(
              const LineChartWidget(),
              arguments: [smodel, mileage, min, max, year, sbrand, carimage],
            );
          },
        );
      },
    );
  }

  carinsert(String userEmail) async {
    var enginSizeCC = (engineSize + 1) * 1000;

    var url = Uri.parse(
        "http://localhost:8080/search/insert/$userEmail?sid=$userEmail&sbrand=$sbrand" +
            "&smodel=$smodel&stransmission=$stransmission&sfueltype=$sfueltype&smileage=$mileage" +
            "&smpg=$mpg&syear=$year&senginesize=$enginSizeCC");
    var response = await http.get(url);
  }

  _inputcheck(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('제대로된 입력값을 설정해 주세요!'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }
}
