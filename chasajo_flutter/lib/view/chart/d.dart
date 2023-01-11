import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'linechart.dart';

class LineChart extends StatelessWidget {
  // double max;
  const LineChart({super.key});

  @override
  Widget build(BuildContext context) {
    double max = 0;
    double min = 0;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Line'),
        ),
        body: LineChartWidget(max, min));
  }
}
