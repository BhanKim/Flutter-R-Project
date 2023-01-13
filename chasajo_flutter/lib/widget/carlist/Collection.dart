import 'dart:convert';
import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cha_sa_jo_flutter/view/list/listinsert.dart';
import 'package:cha_sa_jo_flutter/widget/carlist/todoCol.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../view/list/C.select.dart';
import 'MessageCol.dart';
import 'list.dart';
import 'package:http/http.dart' as http;

class Collection extends StatefulWidget {
  Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  late String heroList = '';
  Carimages carimages = Carimages();
  INput input = INput();
  late String Text2;
  late String brand;
  late String model;
  late String carimage;
  List<String> brnads = [];
  // sbrand=$Topbrand&smodel=$Topmodel&cnt=$Count
  String Topbrand = '';
  String Topmodel = '';
  int Count = 0;
  List Top3List = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Getjasondata();
    // Getjasondata();
    brand = '';
    model = '';
    carimage = '';
    Message.todoList.clear();
    // Text2 = Message.heroText;
    if (Message.action == false) {
      carimages.Listset();
      // input.Output();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Getjasondata(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return const CircularProgressIndicator();
          } else {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    //Text( 'Brand : ${Top3List[0]['sbrand']}     '),
                    // Text( 'Model : ${Top3List[0]['smodel']} '),
                    // Text('Count : ${Top3List[0]['cnt']}
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarselectList(),
                            ),
                          );
                        },
                        child: const Text('Select List')),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'price check ranking',
                              textStyle: const TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TypewriterAnimatedText(
                              '1st : ${Top3List[0]['sbrand']} '
                              '${Top3List[0]['smodel']}  ',
                              textStyle: const TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber),
                            ),
                            TypewriterAnimatedText(
                              '2nd : ${Top3List[1]['sbrand']} '
                              '${Top3List[1]['smodel']}  ',
                              textStyle: const TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            TypewriterAnimatedText(
                              '3rd : ${Top3List[2]['sbrand']}  '
                              '${Top3List[2]['smodel']}  ',
                              textStyle: const TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown),
                            ),
                          ],
                          totalRepeatCount: 100,
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              Container(
                                height: 5,
                                color: Color.fromARGB(255, 173, 32, 33),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset('images/Audi.png'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              Container(
                                height: 5,
                                color: Color.fromARGB(255, 173, 32, 33),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 1,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('A3'),
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[0].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[0].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[0].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[0].carimage,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('A4'),
                              Container(
                                height: 100,
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[1].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[1].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[1].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[1].carimage,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('Q3'),
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[2].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[2].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[2].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[2].carimage,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                color: Color.fromARGB(255, 38, 82, 242),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset('images/BMW.png'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                color: Color.fromARGB(255, 38, 82, 242),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 1,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('S1'),
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[3].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[3].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[3].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[3].carimage,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('S2'),
                              Container(
                                height: 100,
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[4].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[4].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[4].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[4].carimage,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('S3'),
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[5].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[5].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[5].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[5].carimage,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                color: Color.fromARGB(255, 127, 127, 127),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset('images/Benz.png'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                color: Color.fromARGB(255, 127, 127, 127),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 1,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('A-class'),
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[6].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[6].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[6].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[6].carimage,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('E-class'),
                              Container(
                                height: 100,
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[7].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[7].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[7].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[7].carimage,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('C-class'),
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[8].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[8].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[8].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[8].carimage,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                color: Color.fromARGB(255, 0, 169, 132),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset('images/VW.png'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                color: Color.fromARGB(255, 0, 169, 132),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 1,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('Golf'),
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[9].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[9].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[9].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[9].carimage,
                                        width: 120,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('Polo'),
                              Container(
                                height: 100,
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[10].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[10].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[10].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[10].carimage,
                                        width: 110,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('Tiguan'),
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[11].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[11].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[11].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[11].carimage,
                                        width: 110,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                color: Color.fromARGB(255, 16, 42, 77),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 350,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset('images/Ford.png'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                color: Color.fromARGB(255, 16, 42, 77),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 1,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('Focus'),
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[12].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[12].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[12].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[12].carimage,
                                        width: 110,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('Kuga'),
                              Container(
                                height: 100,
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[13].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[13].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[13].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[13].carimage,
                                        width: 110,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('Fiesta'),
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // for (int i = -1; i < 3;i++){

                                        // }
                                        Message.brand =
                                            Message.todoList[14].brand;
                                        brand = Message.brand;
                                        Message.model =
                                            Message.todoList[14].model;
                                        model = Message.model;
                                        Message.carimage =
                                            Message.todoList[14].carimage;
                                        carimage = Message.carimage;
                                        _showhero(
                                            context, brand, model, carimage);
                                      },
                                      child: Image.asset(
                                        Message.todoList[14].carimage,
                                        width: 100,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        });
  } // function

  _showhero(BuildContext context, brand, model, carimage) {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        // 아래 오타아님 바꾸면 안됨.
        return InsertCar(brand: model, model: brand, carimage: carimage);
      }));
      brand = Message.brand;
    });
  }

  Future<List> Getjasondata() async {
    var url = Uri.parse("http://localhost:8080/search/list/top/all");
    var response = await http.get(url);
    var dataConvertedJson = json.decode(
      utf8.decode(response.bodyBytes),
    );
    Top3List = dataConvertedJson;
    print(Top3List);

    return Top3List;
  }
} //end
