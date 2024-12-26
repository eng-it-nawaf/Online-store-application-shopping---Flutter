import 'package:flutter/material.dart';
import 'package:shoppe_ui/features/authentication/presentation/screens/password_typing_screen.dart';
import 'features/authentication/presentation/screens/start_screen.dart';
import 'features/authentication/presentation/screens/create_account_screen.dart';
import 'features/authentication/presentation/screens/login_screen.dart';
import 'features/authentication/presentation/screens/password_screen.dart';
import 'features/authentication/presentation/screens/wrong_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoppe',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/createAccount': (context) => CreateAccountScreen(),
        '/login': (context) => LoginScreen(),
        '/password': (context) => PasswordScreen(),
        '/passTyping': (context) => PasswordTyping(),
        '/wrongPassword': (context) => WrongPasswordScreen(),
      },
    );
  }
}
