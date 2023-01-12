import 'package:cha_sa_jo_flutter/widget/login/login_forget_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class loginForget extends StatelessWidget {
  const loginForget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: LoginForgetWidget(),
    );
  }
}
