import 'package:cha_sa_jo_flutter/widget/carlist/todoCol.dart';

import 'MessageCol.dart';

class Carimages {
  Listset() {
    // 실수로 브랜드와 모델을 반대로 했음. 하지만 fianl로 넘어갈땐 두개 바껏으니 상관없지않을까?
    Message.todoList.add(
        TodoList(brand: 'A3', model: 'Audi', carimage: 'images/AudiA3.png'));
    Message.todoList.add(
        TodoList(brand: 'A4', model: 'Audi', carimage: 'images/AudiA4.png'));
    Message.todoList.add(
        TodoList(brand: 'Q3', model: 'Audi', carimage: 'images/AudiQ3.png'));
    Message.todoList.add(
        TodoList(brand: 'S1', model: 'BMW', carimage: 'images/1 Series.png'));
    Message.todoList.add(
        TodoList(brand: 'S2', model: 'BMW', carimage: 'images/2 Series.png'));
    Message.todoList.add(
        TodoList(brand: 'S3', model: 'BMW', carimage: 'images/3 Series.png'));
    Message.todoList.add(TodoList(
        brand: 'Aclass', model: 'Benz', carimage: 'images/A-class.png'));
    Message.todoList.add(TodoList(
        brand: 'Eclass', model: 'Benz', carimage: 'images/E-class.png'));
    Message.todoList.add(TodoList(
        brand: 'Cclass', model: 'Benz', carimage: 'images/C-class.png'));
    Message.todoList.add(
        TodoList(brand: 'Golf', model: 'VW', carimage: 'images/VW Golf.png'));
    Message.todoList.add(
        TodoList(brand: 'Polo', model: 'VW', carimage: 'images/VW Polo.png'));
    Message.todoList.add(TodoList(
        brand: 'Tiguan', model: 'VW', carimage: 'images/VW Tiguan.png'));
    Message.todoList.add(TodoList(
        brand: 'Focus', model: 'Fored', carimage: 'images/Ford Focus.png'));
    Message.todoList.add(TodoList(
        brand: 'Kuga', model: 'Fored', carimage: 'images/Ford Kuga.png'));
    Message.todoList.add(TodoList(
        brand: 'Fiesta', model: 'Fored', carimage: 'images/Fored Fiesta.png'));
  }
}

class INput {
  Output() {
    List<String> carimage = [];
    carimage.add('images/AudiA3.png');
    carimage.add('images/AudiA4.png');
    carimage.add('images/AudiQ3.png');
    // 'images/AudiA4.png';
    // 'images/AudiQ3.png';
    // Message.todoList.add(
  }
}
