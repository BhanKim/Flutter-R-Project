import 'package:cha_sa_jo_flutter/constants/image_strings.dart';
import 'package:cha_sa_jo_flutter/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: const AssetImage(tSplashImage),
          height: 100,
        ),
        Text(tLoginTitle, style: Theme.of(context).textTheme.headline3),
        Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
