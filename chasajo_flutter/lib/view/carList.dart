import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widget/carlist/Collection.dart';

// Collection collec = Collection();

class carList extends StatelessWidget {
  const carList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Collection(),
      ),
    );
  }
}
