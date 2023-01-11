import 'package:cha_sa_jo_flutter/constants/colors.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }

  // --- THEME ---
  final ThemeData _lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColors.blue,
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      onPrimary: CommonColors.onWhite, //required
      onSecondary: CommonColors.onWhite, //required
      primary: LightColors.orange1, // point color1
      primaryContainer: LightColors.orange2, // point color2
      secondary: LightColors.blue, // point color3
      background: LightColors.gray1, // app backgound
      surface: LightColors.gray2, // card background
      outline: LightColors.gray3, // card line or divider
      surfaceVariant: LightColors.gray4, // disabled
      onSurface: LightColors.gray5, // text3
      onSurfaceVariant: LightColors.gray6, //text2
      onBackground: LightColors.important, //text1
      error: CommonColors.red, // danger
      tertiary: CommonColors.yellow, // normal
      tertiaryContainer: CommonColors.green, // safe

      onError: LightColors.basic, //no use
      brightness: Brightness.light,
    ),
  );

  final ThemeData _darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkColors.gray1,
    ),
    scaffoldBackgroundColor: DarkColors.gray2,
    colorScheme: const ColorScheme(
      onPrimary: CommonColors.onWhite, //required
      onSecondary: CommonColors.onWhite, //required
      primary: DarkColors.orange1, // point color1
      primaryContainer: DarkColors.orange2, // point color2
      secondary: DarkColors.blue, // point color3
      background: DarkColors.gray1, // app backgound
      surface: DarkColors.gray2, // card background
      outline: DarkColors.gray3, // card line or divider
      surfaceVariant: DarkColors.gray4, // disabled
      onSurface: DarkColors.important, //text3
      onSurfaceVariant: DarkColors.gray6, // text2
      onBackground: DarkColors.important, //text1
      error: CommonColors.red, // danger
      tertiary: CommonColors.yellow, // normal
      tertiaryContainer: CommonColors.green, // safe

      onError: DarkColors.basic, // no use
      brightness: Brightness.light,
    ),
  );
  // ---
} // END
