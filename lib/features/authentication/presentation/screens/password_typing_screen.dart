import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/widgets/login_background_top.dart'; // Background widget
import 'package:shoppe_ui/core/widgets/user_avatar_widget.dart'; // User avatar widget


class PasswordTyping extends StatelessWidget {
  const PasswordTyping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background widget
          const LoginBackgroundTop(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // User avatar widget with required parameters
                  const UserAvatarWidget(userName: 'Romina'),
                  const SizedBox(height: 10),
                  // Instruction text
                  const SizedBox(height: 10),
                  // Password indicator circles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      8,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index < 5 ? Colors.blue : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
