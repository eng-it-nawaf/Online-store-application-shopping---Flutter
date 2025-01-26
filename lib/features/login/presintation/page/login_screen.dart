import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/login_bloc.dart';
import '../manager/login_event.dart';
import '../manager/login_state.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:shoppe_ui/core/widgets/login_background_top.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        backgroundColor: AppTheme.background,
        body: SafeArea(
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.isSuccess) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Login Successful')));
              }
            },
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


                // Use SingleChildScrollView for the scrollable content
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align elements to the left
                          children: [
                            const SizedBox(height: 300), // Ensure space for images
                            const Text(
                              'Login',
                              style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start, // Text alignment to the left
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Good to see you back! 🖤',
                              style: TextStyle(fontSize: 19, color: AppTheme.cancel,),
                              textAlign: TextAlign.start, // Text alignment to the left
                            ),
                            const SizedBox(height: 40),
                            CustomTextField(
                              hintText: 'Email',
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              borderRadius: 20.0,
                              onChanged: (value) =>
                                  context.read<LoginBloc>().add(EmailChanged(value)),
                              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                              prefixIcon: Icon(Icons.email, color: AppTheme.iconBlue),
                            ),
                            const SizedBox(height: 40),
                            CustomButton(
                              text: state.isSubmitting ? 'Submitting...' : 'Next',
                              onPressed: state.isSubmitting
                                  ? null
                                  : () => context
                                  .read<LoginBloc>()
                                  .add(LoginSubmitted(emailController.text)),
                            ),
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
                        );
                      },
                    ),
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
