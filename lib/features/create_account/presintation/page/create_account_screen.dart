import 'package:flutter/material.dart';
import 'package:shoppe_ui/features/create_account/data/viewmodels/create_account_viewmodel.dart';
import '../widgets/account_form.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(
        children: [
          // إضافة الصور
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
          // نموذج حساب المستخدم
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AccountForm(),
          ),
        ],
      ),
    );
  }
}

