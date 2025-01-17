import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/core/constants/colors.dart';
import 'package:shoppe_ui/core/widgets/custom_button.dart';
import '../manager/start_bloc.dart';
import '../manager/start_event.dart';
import '../manager/start_state.dart';
import 'package:shoppe_ui/features/create_account/presintation/page/create_account_screen.dart';
import 'package:shoppe_ui/features/login/presintation/page/login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StartBloc(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.shopping_bag, size: 60, color: AppColors.primary),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Shoppe',
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 9),
                const Text(
                  'Beautiful eCommerce UI Kit for your online store',
                  style: TextStyle(fontSize: 19, color: AppColors.textSecondary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 61),
                CustomButton(
                  text: "Let's get started",
                  onPressed: () {
                    context.read<StartBloc>().add(NavigateToCreateAccount());
                    Navigator.pushNamed(context, '/createAccount');
                  },
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    context.read<StartBloc>().add(NavigateToLogin());
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    "I already have an account",
                    style: TextStyle(color: AppColors.primary, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
