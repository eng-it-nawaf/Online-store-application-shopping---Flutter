import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/widgets/custom_text_field.dart';
import 'package:shoppe_ui/core/widgets/custom_button.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shoppe_ui/features/create_account/presintation/widgets/custom_phone_input.dart';

// class AccountForm extends StatelessWidget {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final phoneController = TextEditingController();
//   final PhoneNumber initialPhoneNumber = PhoneNumber(isoCode: 'US');
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start, // لضمان محاذاة النصوص إلى اليسار
//         children: [
//           const SizedBox(height: 140), // المساحة الفارغة قبل النصوص
//
//           // عنوان النص الأول
//           Text(
//             'Create',
//             style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//               fontWeight: FontWeight.bold,
//               fontSize: 50,
//               color: AppTheme.textColor,
//             ),
//           ),
//           Text(
//             'Account',
//             style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//               fontWeight: FontWeight.bold,
//               fontSize: 50,
//               color: AppTheme.textColor,
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // أيقونة النصوص
//           Image.asset(
//             'assets/images/bubble 02 (1).png',
//             height: 90,
//             width: 90,
//             color: AppTheme.iconBlue,
//           ),
//           const SizedBox(height: 15),
//
//           // الحقول النصية
//           CustomTextField(
//             hintText: 'Email',
//
//             controller: emailController,
//             keyboardType: TextInputType.emailAddress,
//           ),
//           const SizedBox(height: 14),
//           CustomTextField(
//             hintText: 'Password',
//             controller: passwordController,
//             isPassword: true,
//           ),
//           const SizedBox(height: 14),
//
//           CustomPhoneNumberInput(
//
//             controller: phoneController,
//             initialNumber: initialPhoneNumber,
//             onChanged: (PhoneNumber number) {
//               // Logic for handling phone number change
//             },
//           ),
//           const SizedBox(height: 16),
//
//           // زر "Done"
//           Center(
//             child: CustomButton(
//               text: 'Done',
//               onPressed: () {
//                 Navigator.pushNamed(context, '/product');
//               },
//             ),
//           ),
//           const SizedBox(height: 14),
//
//           // زر "Cancel"
//           Center(
//             child: TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               style: TextButton.styleFrom(
//                 foregroundColor: AppTheme.cancel,
//                 textStyle: const TextStyle(fontSize: 16),
//               ),
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class AccountForm extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final PhoneNumber initialPhoneNumber = PhoneNumber(isoCode: 'US');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 140),

          // عنوان النص الأول
          Text(
            'Create',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: AppTheme.textColor,
            ),
          ),
          Text(
            'Account',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: AppTheme.textColor,
            ),
          ),
          const SizedBox(height: 20),

          // أيقونة النصوص
          Image.asset(
            'assets/images/bubble 02 (1).png',
            height: 90,
            width: 90,
            color: AppTheme.iconBlue,
          ),
          const SizedBox(height: 15),

          // الحقول النصية
          CustomTextField(
            hintText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            borderRadius: 30.0, // جعل الحقل دائري
            fillColor: AppTheme.background,
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            prefixIcon: Icon(Icons.email, color: AppTheme.iconBlue),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: 'Password',
            controller: passwordController,
            isPassword: true,
            borderRadius: 30.0, // جعل الحقل دائري
            fillColor: AppTheme.background,
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            prefixIcon: Icon(Icons.lock, color: AppTheme.iconBlue),
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
              text: 'Done',
              onPressed: () {
                Navigator.pushNamed(context, '/product');
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
                foregroundColor: AppTheme.cancel,
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
    );
  }
}
