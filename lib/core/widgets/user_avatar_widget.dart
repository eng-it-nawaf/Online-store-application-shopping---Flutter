import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  final String userName;

  const UserAvatarWidget({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const CircleAvatar(
              radius: 58,
              backgroundColor: Colors.white,
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/image.png'),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Text(
          'Hello, $userName!!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 40),
        // النص "Type your password"
        const Text(
          'Type your password',
          style: TextStyle(
            fontSize: 19,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
