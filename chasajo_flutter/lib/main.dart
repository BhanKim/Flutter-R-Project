import 'package:cha_sa_jo_flutter/firebase_options.dart';

import 'package:cha_sa_jo_flutter/view/Home/Home.dart';
import 'package:cha_sa_jo_flutter/view/Home/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //backgroundColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}
