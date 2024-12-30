import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/widgets/custom_button.dart';
import 'package:shoppe_ui/core/widgets/custom_text_field.dart';
import 'package:shoppe_ui/core/constants/colors.dart';
import 'package:shoppe_ui/core/widgets/login_background_top.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            const LoginBackgroundTop(),
            Positioned(
              top: 10,
              right: -155,
              child: Container(
                width: 373.53,
                height: 412.65,
                child: Image.asset(
                  'assets/images/Login3.png',
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              right: -100,
              child: Container(
                width: 373.53,
                height: 442.65,
                child: Image.asset(
                  'assets/images/Login4.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView( // Wrap the Column in SingleChildScrollView
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 350),
                    const Text(
                      'Login',
                      style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Good to see you back! 🖤',
                      style: TextStyle(fontSize: 19, color: Colors.grey),
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      hintText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      borderRadius: 20.0,
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: 'Next',
                      onPressed: () {
                        Navigator.pushNamed(context, '/password');
                      },
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.cancel,
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
