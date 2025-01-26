import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/core/widgets/login_background_top.dart';
import 'package:shoppe_ui/core/widgets/user_avatar_widget.dart';
import '../manager/password_bloc.dart';
import '../manager/password_event.dart';
import '../manager/password_state.dart';
import 'package:shoppe_ui/core/AppTheme.dart';


class PasswordTyping extends StatelessWidget {
  const PasswordTyping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: BlocProvider(
        create: (context) => PasswordBloc(),
        child: Stack(
          children: [
            const LoginBackgroundTop(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const UserAvatarWidget(userName: 'Romina'),
                    const SizedBox(height: 10),
                    // Create circles for password input
                    BlocBuilder<PasswordBloc, PasswordState>(
                      builder: (context, state) {
                        int passwordLength = 0;
                        if (state is PasswordUpdated) {
                          passwordLength = state.length;
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            8,
                                (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Container(
                                  width: 17,
                                  height: 17,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index < passwordLength
                                        ? AppTheme.priceColor
                                        : AppTheme.background,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    // Password TextField (still usable by the BLoC)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        obscureText: true,
                        maxLength: 8,
                        onChanged: (password) {
                          context.read<PasswordBloc>().add(PasswordTyped(password));
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter password',
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
