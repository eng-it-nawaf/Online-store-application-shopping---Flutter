import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/core/constants/colors.dart';  // استيراد ملف الألوان
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
    final screenWidth = MediaQuery.of(context).size.width; // عرض الشاشة
    final screenHeight = MediaQuery.of(context).size.height; // ارتفاع الشاشة

    return BlocProvider(
      create: (_) => PasswordBloc(),
      child: Scaffold(
        backgroundColor: backgroundColor,
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
                      SizedBox(height: screenHeight * 0.02), // مسافة نسبية
                      _buildPasswordFields(context, screenWidth),
                      if (state.showError)
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.02), // مسافة نسبية
                          child: Text(
                            "Incorrect password, try again!",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: screenWidth * 0.04, // حجم الخط نسبي
                            ),
                          ),
                        ),
                    ],
                  ),
                  // وضع العناصر في أسفل الصفحة
                  Positioned(
                    bottom: screenHeight * 0.05, // المسافة من الأسفل (نسبة مئوية)
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/wrongPassword'); // تنقل إلى شاشة Wrong Password
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // توسيط العناصر
                        children: [
                          Text(
                            'Wrong password?',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.none, // إزالة الخط السفلي
                              fontSize: screenWidth * 0.04, // حجم الخط نسبي
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02), // مسافة نسبية
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.015), // تباعد داخلي نسبي
                            decoration: BoxDecoration(
                              color: Colors.blue, // لون خلفية الدائرة
                              shape: BoxShape.circle, // شكل دائري
                            ),
                            child: Icon(
                              Icons.arrow_forward, // رمز السهم
                              color: Colors.white, // لون السهم
                              size: screenWidth * 0.05, // حجم السهم نسبي
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
      width: screenWidth * 0.12, // عرض الحقل نسبي
      height: screenWidth * 0.12, // ارتفاع الحقل نسبي
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // مسافة أفقية نسبية
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        obscureText: true,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: screenWidth * 0.05), // حجم الخط نسبي
        maxLength: 1,
        decoration: const InputDecoration(
          border: InputBorder.none, // إزالة الحدود
          counterText: "", // إزالة عداد الأحرف
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