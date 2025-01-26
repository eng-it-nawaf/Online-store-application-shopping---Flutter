import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:shoppe_ui/core/widgets/custom_button.dart';
import '../manager/start_bloc.dart';
import '../manager/start_event.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StartBloc(),
      child: Scaffold(
        backgroundColor: AppTheme.background,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo with Shadow
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.priceColor.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: AppTheme.priceColor,
                      backgroundImage: AssetImage('assets/images/appp_icon.png'),
                    ),
                  ),
                  const SizedBox(height: 25),
                  // App Name
                  const Text(
                    'Shop-Here',
                    style: TextStyle(
                      fontFamily: 'Roboto', // استخدام الخط
                      fontSize: 52,
                      color: AppTheme.priceColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Description Text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Everything you need for an easy and',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: AppTheme.cancel,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'enjoyable online shopping experience.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: AppTheme.cancel,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Start Now Button
                  CustomButton(
                    text: "Start now",
                    onPressed: () {
                      context.read<StartBloc>().add(NavigateToCreateAccount());
                      Navigator.pushNamed(context, '/createAccount');
                    },
                  ),
                  const SizedBox(height: 30),
                  // Already Have an Account Button
                  TextButton(
                    onPressed: () {
                      context.read<StartBloc>().add(NavigateToLogin());
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I already have an account',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppTheme.background,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}