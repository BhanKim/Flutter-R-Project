import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeTabbar extends StatefulWidget {
  const HomeTabbar({super.key});

  @override
  State<HomeTabbar> createState() => _HomeTabbarState();
}

class _HomeTabbarState extends State<HomeTabbar>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
    //length 페이지 수
    //vsync 어디에 연결할것인지
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorColor: Colors.green,
      tabs: const [
        Tab(
          text: "Home",
        ),
        Tab(
          text: "Work",
        ),
        Tab(
          text: "Play",
        ),
      ],
      labelColor: Colors.black,
      // add it here
      indicator: DotIndicator(
        color: Colors.blue.shade300,
        distanceFromCenter: 16,
        radius: 5,
        paintingStyle: PaintingStyle.fill,
      ),
    );
  }
}
