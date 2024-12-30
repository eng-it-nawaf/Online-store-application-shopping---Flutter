import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/widgets/custom_text_field.dart';
import 'package:shoppe_ui/core/constants/colors.dart';
import 'package:shoppe_ui/core/widgets/custom_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CreateAccountScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final PhoneNumber initialPhoneNumber = PhoneNumber(isoCode: 'US');

  CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset(
              'assets/images/bubble 02.png',
              width: 240,
              height: 240,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            right: 0,
            top: -250,
            bottom: 0,
            child: Image.asset(
              'assets/images/bubble 01.png',
              width: 110,
              height: double.infinity,
              fit: BoxFit.contain,
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 170),

                    // النصوص العلوية
                    Text(
                      'Create  ',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'Account ',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/images/bubble 02 (1).png',
                      height: 90,
                      width: 90,
                      color: AppColors.iconBlue,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      hintText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      borderRadius: 20.0,
                    ),
                    const SizedBox(height: 14),

                    CustomTextField(
                      hintText: 'Password',
                      controller: passwordController,
                      isPassword: true,
                      borderRadius: 20.0,
                    ),
                    const SizedBox(height: 14),

                    CustomPhoneNumberInput(
                      controller: phoneController,
                      initialNumber: initialPhoneNumber,
                      onChanged: (PhoneNumber number) {
                        // Logic for handling phone number change
                      },
                    ),
                    const SizedBox(height: 16),

                    // زر "Done"
                    Center(
                      child: CustomButton(
                        text: 'Done', // النص الخاص بالزر
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ),
                    const SizedBox(height: 14),

                    // زر "Cancel"
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
          ),
        ],
      ),
    );
  }
}
