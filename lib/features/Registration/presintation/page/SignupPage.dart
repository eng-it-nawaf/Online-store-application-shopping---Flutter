import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppe_ui/core/ThemeProvider.dart';
import 'package:shoppe_ui/core/utils/common.dart';
import 'package:shoppe_ui/core/utils/toast_helper.dart';
import 'package:shoppe_ui/core/utils/validation_helper.dart';
import 'package:shoppe_ui/core/widgets/custom_button.dart';
import 'package:shoppe_ui/features/Registration/presintation/Widget/CustomTextField.dart';
import 'package:shoppe_ui/features/Registration/presintation/Widget/strings.dart';
import 'package:shoppe_ui/features/Registration/presintation/manager/Registration_bloc.dart';
import '../../../../core/AppTheme.dart';
import '../../../../core/utils/ScreenUtil.dart';
import '../../../../injection_container.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late ScrollController _scrollController;
  late ScreenUtil screenUtil;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    screenUtil = ScreenUtil();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _startLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  void _stopLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  void _resetFields() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    // قائمة حقول الإدخال
    List<InputField> inputFields = [
      InputField(
        controller: _nameController,
        labelText: AppSignUpStrings.nameHint,
        prefixIcon: Icons.person,
      ),
      InputField(
        controller: _emailController,
        labelText: AppSignUpStrings.emailHint,
        prefixIcon: Icons.email,
      ),
      InputField(
        controller: _passwordController,
        labelText: AppSignUpStrings.passwordHint,
        prefixIcon: Icons.lock,
        obscureText: _obscurePassword,
        showSuffixIcon: true,
        onSuffixIconPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
      InputField(
        controller: _confirmPasswordController,
        labelText: AppSignUpStrings.confirmPasswordHint,
        prefixIcon: Icons.lock,
        obscureText: _obscureConfirmPassword,
        showSuffixIcon: true,
        onSuffixIconPressed: () {
          setState(() {
            _obscureConfirmPassword = !_obscureConfirmPassword;
          });
        },
      ),
    ];

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? AppTheme.textSecondary : AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          AppSignUpStrings.signUpTitle,
          style: TextStyle(
            fontSize: 18,
            color: themeProvider.isDarkMode ? AppTheme.secondaryColor : AppTheme.backgroundColor,
          ),
        ),
        backgroundColor: themeProvider.isDarkMode ? AppTheme.appBarColor : AppTheme.primary,
        actions: [
          IconButton(
            icon: Icon(themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => sl<RegistrationBloc>(),
        child: BlocConsumer<RegistrationBloc, RegistrationState>(
          listener: (context, state) {
            if (state is SignUpError) {
              _stopLoading();
              ToastHelper.showErrorToast(context, state.errorMessage);
            }
            if (state is SignUpLoaded) {
              _stopLoading();
              _resetFields();
              ToastHelper.showSuccessToast(context, AppSignUpStrings.signUpSuccess);

              cachedData(key: "token", data: state.registrationModel[0].token);
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/animations/signup_animation.json',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 5),

                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: inputFields.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final field = inputFields[index];
                      return CustomTextField(
                        controller: field.controller,
                        labelText: field.labelText,
                        prefixIcon: field.prefixIcon,
                        obscureText: field.obscureText,
                        showSuffixIcon: field.showSuffixIcon,
                        onSuffixIconPressed: field.onSuffixIconPressed,
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          AppSignUpStrings.loginButton,
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? AppTheme.iconBlue : AppTheme.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        AppSignUpStrings.haveAccount,
                        style: TextStyle(
                          color: themeProvider.isDarkMode ? AppTheme.secondaryColor : AppTheme.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  _isLoading
                      ? CircularProgressIndicator()
                      : CustomButton(
                    text: AppSignUpStrings.signUpButton,
                    onPressed: () async {
                      if (ValidationHelper.validateSignUpInputs(
                        context: context,
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        confirmPassword: _confirmPasswordController.text,
                      )) {
                        _startLoading();
                        context.read<RegistrationBloc>().add(
                          SignUpEvent(
                            username: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// نموذج بيانات لحقول الإدخال
class InputField {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final bool showSuffixIcon;
  final VoidCallback? onSuffixIconPressed;

  InputField({
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.showSuffixIcon = false,
    this.onSuffixIconPressed,
  });
}

