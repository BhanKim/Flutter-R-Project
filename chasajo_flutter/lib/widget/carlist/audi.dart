import 'dart:js';

import 'package:cha_sa_jo_flutter/widget/carlist/showcar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view/list/listinsert.dart';
import 'MessageCol.dart';

class Audi {
  late String brand;
  late String model;
  carshow _carshow = carshow();
  _Audi() {
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
                height: 50,
                color: Colors.red,
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
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Audi",
                      style: TextStyle(fontSize: 30),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Message.brand = Message.todoList[1].brand;
                    //     brand = Message.brand;
                    //     Message.model = Message.todoList[1].model;
                    //     model = Message.model;
                    //     _showhero(context, brand, model);
                    //   },
                    Image.asset('images/Audi.png'),
                    // ),
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
                height: 50,
                color: Colors.red,
              )
            ],
          ),
        ),
      ],
    );
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
                        _carshow;
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
                        _carshow;
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
                        _carshow;
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
    );
  }

  // _showhero(BuildContext context, brand, model) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     // 아래 오타아님 바꾸면 안됨.
  //     return InsertCar(brand: model, model: brand);
  //   }));
  //   brand = Message.brand;
  // }
}
