import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:shoppe_ui/core/ThemeProvider.dart';
import 'package:shoppe_ui/core/utils/common.dart';
import 'package:shoppe_ui/core/utils/toast_helper.dart';
import 'package:shoppe_ui/core/utils/validation_helper.dart';
import 'package:shoppe_ui/core/widgets/custom_button.dart';
import 'package:shoppe_ui/features/Home/presintation/page/HomePage.dart';
import 'package:shoppe_ui/features/Registration/presintation/Widget/CustomTextField.dart';
import 'package:shoppe_ui/features/Registration/presintation/Widget/strings.dart';
import 'package:shoppe_ui/features/Registration/presintation/manager/Registration_bloc.dart';
import '../../../../core/AppTheme.dart';
import '../../../../core/utils/ScreenUtil.dart';
import '../../../../injection_container.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LoginPage> {
  late ScrollController _scrollController;
  late ScreenUtil screenUtil;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    screenUtil = ScreenUtil();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
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
    _usernameController.clear();
    _passwordController.clear();
  }

  Future<void> _loginUser() async {
    if (_formKey.currentState?.validate() ?? false) {
      _startLoading();
      try {
        final response = await http.post(
          Uri.parse('https://your-api.com/auth/login'),
          body: {
            'username': _usernameController.text,
            'password': _passwordController.text,
          },
        );

        if (response.statusCode == 200) {
          ToastHelper.showSuccessToast(context, AppLoginStrings.loginSuccess);
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          ValidationHelper.handleLoginErrors(context, response.statusCode);
        }
      } on SocketException {
        ToastHelper.showErrorToast(context, AppLoginStrings.noInternet);
      } catch (e) {
        ToastHelper.showErrorToast(context, AppLoginStrings.loginError);
      } finally {
        _stopLoading();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? AppTheme.textSecondary : AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          AppLoginStrings.loginTitle,
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
            if (state is LogInError) {
              _stopLoading();
              ToastHelper.showErrorToast(context, state.errorMessage);
            }
            if (state is LogInLoaded) {
              _stopLoading();
              _resetFields();
              ToastHelper.showSuccessToast(context, AppLoginStrings.welcomeMessage);
              cachedData(key: "token", data: state.registrationModel[0].token);
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animations/signup_animation.json',
                      height: 250,
                      width: 250,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _usernameController,
                      labelText: AppLoginStrings.usernameHint,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _passwordController,
                      labelText: AppLoginStrings.passwordHint,
                      obscureText: _obscurePassword,
                      prefixIcon: Icons.lock,
                      showSuffixIcon: true,
                      onSuffixIconPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            AppLoginStrings.createAccount,
                            style: TextStyle(
                              color: themeProvider.isDarkMode ? AppTheme.iconBlue : AppTheme.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          AppLoginStrings.noAccount,
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
                      text: AppLoginStrings.loginButton,
                      onPressed: () async {
                        if (ValidationHelper.validateLoginInputs(
                          context: context,
                          username: _usernameController.text,
                          password: _passwordController.text,
                        )) {
                          _startLoading();
                          context.read<RegistrationBloc>().add(
                            LogInEvent(
                              username: _usernameController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}