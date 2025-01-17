import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/core/widgets/login_background_top.dart';
import 'package:shoppe_ui/core/widgets/user_avatar_widget.dart';
import 'package:shoppe_ui/core/constants/colors.dart';
import '../manager/wrong_password_bloc.dart';
import '../manager/wrong_password_event.dart';
import '../manager/wrong_password_state.dart';

class WrongPasswordScreen extends StatelessWidget {
  const WrongPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocProvider(
        create: (_) => WrongPasswordBloc(),
        child: BlocBuilder<WrongPasswordBloc, WrongPasswordState>(
          builder: (context, state) {
            return Stack(
              children: [
                const LoginBackgroundTop(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const UserAvatarWidget(userName: 'Romina'),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            8,
                                (index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                width: 17,
                                height: 17,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        if (state.isLocked)
                          Text(
                            'Too many attempts! Try again later.',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          )
                        else
                          GestureDetector(
                            onTap: () {
                              context.read<WrongPasswordBloc>().add(IncrementPasswordAttempt());
                            },
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
