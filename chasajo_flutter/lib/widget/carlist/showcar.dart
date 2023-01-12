import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view/list/listinsert.dart';
import 'MessageCol.dart';

class carshow {
  _showhero(BuildContext context, brand, model, carimage) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      // 아래 오타아님 바꾸면 안됨.
      return InsertCar(brand: model, model: brand, carimage: carimage);
    }));
    brand = Message.brand;
  }
}
