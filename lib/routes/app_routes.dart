import 'package:flutter/material.dart';
import 'package:shoppe_ui/features/start/presintation/page/start_screen.dart';
import 'package:shoppe_ui/features/create_account/presintation/page/create_account_screen.dart';
import 'package:shoppe_ui/features/login/presintation/page/login_screen.dart';
import 'package:shoppe_ui/features/password/presintation/page/password_screen.dart';
import 'package:shoppe_ui/features/password_typing/presintation/page/password_typing_screen.dart';
import 'package:shoppe_ui/features/wrong_password/presintation/page/wrong_password_screen.dart';
import 'package:shoppe_ui/features/Product/presintation/page/productsPage.dart';

import 'package:shoppe_ui/features/Product/presintation/Widget/BottomNavigation.dart';



class AppRoutes {
  static const String start = '/';
  static const String createAccount = '/createAccount';
  static const String login = '/login';
  static const String password = '/passwordScreen';
  static const String passwordTyping = '/passTyping';
  static const String wrongPassword = '/wrongPasswordScreen';
  static const String productPage = '/product';
  static const String bottomNavig = '/bottom';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case start:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case createAccount:
        return MaterialPageRoute(builder: (_) => CreateAccountScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case password:
        return MaterialPageRoute(builder: (_) => PasswordScreen());
      case passwordTyping:
        return MaterialPageRoute(builder: (_) => const PasswordTyping());
      case wrongPassword:
        return MaterialPageRoute(builder: (_) => const WrongPasswordScreen());
      case productPage:
        return MaterialPageRoute(builder: (_) => ProductPage());
      case bottomNavig:
        return MaterialPageRoute(builder: (_) => BottomNavigation());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }
}