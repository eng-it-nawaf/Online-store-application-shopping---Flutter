import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:shoppe_ui/features/password/presintation/manager/password_bloc.dart';
import '../manager/password_event.dart';
import '../manager/password_state.dart';
import 'package:shoppe_ui/core/widgets/user_avatar_widget.dart';
import 'package:shoppe_ui/core/widgets/login_background_top.dart';

class PasswordScreen extends StatelessWidget {
  final List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  PasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => PasswordBloc(),
      child: Scaffold(
        backgroundColor: AppTheme.background,
        body: SafeArea(
          child: BlocBuilder<PasswordBloc, PasswordState>(
            builder: (context, state) {
              return Stack(
                children: [
                  const LoginBackgroundTop(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const UserAvatarWidget(userName: "Romina"),
                      SizedBox(height: screenHeight * 0.02),
                      _buildPasswordFields(context, screenWidth),
                      if (state.showError)
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.02),
                          child: Text(
                            "Incorrect password, try again!",
                            style: TextStyle(
                              color:AppTheme.error,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Positioned(
                    bottom: screenHeight * 0.05,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/wrongPassword');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Wrong password?',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.none,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.015),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color:AppTheme.background,
                              size: screenWidth * 0.05,
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
      ),
    );
  }

  Widget _buildPasswordFields(BuildContext context, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return _buildPasswordField(
          controllers[index],
          focusNodes[index],
          index < 3 ? focusNodes[index + 1] : focusNodes[0],
          context,
          screenWidth,
        );
      }),
    );
  }

  Widget _buildPasswordField(
      TextEditingController controller, FocusNode currentFocus, FocusNode nextFocus, BuildContext context, double screenWidth) {
    return Container(
      width: screenWidth * 0.12,
      height: screenWidth * 0.12,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        obscureText: true,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: screenWidth * 0.05),
        maxLength: 1,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "",
        ),
        onChanged: (value) {
          if (value.length == 1) {
            context.read<PasswordBloc>().add(PasswordChanged([value]));
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
      ),
    );
  }
}