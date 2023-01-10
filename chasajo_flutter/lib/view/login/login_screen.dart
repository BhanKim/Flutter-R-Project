import 'package:cha_sa_jo_flutter/constants/sizes.dart';
import 'package:cha_sa_jo_flutter/widget/login/login_footer_widget.dart';
import 'package:cha_sa_jo_flutter/widget/login/login_form_widget.dart';
import 'package:cha_sa_jo_flutter/widget/login/login_header_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            children: const [
              SizedBox(
                height: 50,
              ),
              LoginHeaderWidget(),
              LoginForm(),
              //LoginFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
