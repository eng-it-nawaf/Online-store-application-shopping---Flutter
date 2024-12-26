import 'package:flutter/material.dart';

class LoginBackgroundTop extends StatelessWidget {
  const LoginBackgroundTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -106,
          left: -50,
          child: Image.asset(
            'assets/images/Login1.png',
            width: 373.53,
            height: 542.65,
          ),
        ),
        Positioned(
          top: -100,
          left: -100,
          child: Image.asset(
            'assets/images/Login2.png',
            width: 402.87,
            height: 442.65,
          ),
        ),
      ],
    );
  }
}
