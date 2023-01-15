import 'package:cha_sa_jo_flutter/constants/image_strings.dart';
import 'package:cha_sa_jo_flutter/constants/sizes.dart';
import 'package:cha_sa_jo_flutter/constants/text_strings.dart';
import 'package:cha_sa_jo_flutter/widget/signup/form_header_widget.dart';
import 'package:cha_sa_jo_flutter/widget/signup/signup_footer_widget.dart';
import 'package:cha_sa_jo_flutter/widget/signup/signup_form_widget.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              const SizedBox(height: 20),
              // Header Widget 사용법
              FormHeaderWidget(
                  image: tSplashImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle),
              SignUpFormWidget(),
              SignUpFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
