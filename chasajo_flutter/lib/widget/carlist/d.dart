import 'package:cha_sa_jo_flutter/view/list/listinsert.dart';
import 'package:cha_sa_jo_flutter/widget/carlist/todoCol.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'MessageCol.dart';
import 'list.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                        color: Colors.lightGreen,
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
                        color: Colors.white,
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
                        color: Colors.lightGreen,
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[0].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[0].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[1].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[1].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[2].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[2].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.lightGreen,
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
                        color: Colors.white,
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
                        color: Colors.lightGreen,
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[3].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[3].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[4].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[4].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[5].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[5].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.lightGreen,
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
                        color: Colors.lightGreen,
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
                                Message.brand = Message.todoList[6].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[6].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                                Message.brand = Message.todoList[7].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[7].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                                Message.brand = Message.todoList[8].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[8].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.lightGreen,
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
                        color: Colors.lightGreen,
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[9].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[9].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[10].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[10].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[11].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[11].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.lightGreen,
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
                        color: Colors.white,
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
                        color: Colors.lightGreen,
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[12].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[12].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[13].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[13].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // for (int i = -1; i < 3;i++){

                                // }
                                Message.brand = Message.todoList[14].brand;
                                brand = Message.brand;
                                Message.model = Message.todoList[14].model;
                                model = Message.model;
                                _showhero(context, brand, model);
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
  } // function

  _showhero(BuildContext context, brand, model) {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        // 아래 오타아님 바꾸면 안됨.
        return InsertCar(brand: model, model: brand);
      }));
      brand = Message.brand;
    });
  }
} //end
