import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:shoppe_ui/core/ThemeProvider.dart';
import 'package:shoppe_ui/core/utils/common.dart';
import 'package:shoppe_ui/features/Home/presintation/page/HomePage.dart';
import 'package:shoppe_ui/features/Onpording/presintation/page/OnpordingPage.dart';
import 'package:shoppe_ui/features/Product/presintation/Widget/BottomNavigation.dart';
import 'package:shoppe_ui/features/Product/presintation/page/productsPage.dart';
import 'package:shoppe_ui/features/Registration/presintation/page/LoginPage.dart';
import 'package:shoppe_ui/features/Registration/presintation/page/SignupPage.dart';
import 'injection_container.dart' as object;
import 'package:shoppe_ui/core/AppTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await object.init();

  final token = await getCachedData(
    key: "token",
    retrievedDataType: String,
    returnType: String,
  ) ?? "";

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return GetMaterialApp(
            title: 'Shoppe',
            theme: themeProvider.getTheme(),
            debugShowCheckedModeBanner: false,
            initialRoute: (token?.isNotEmpty ?? false) ? '/home' : '/onboarding',
            getPages: [
              GetPage(name: '/onboarding', page: () => OnboardingPage()),
              GetPage(name: '/home', page: () => HomePage()),
              GetPage(name: '/product', page: () => ProductPage()),
              GetPage(name: '/bottom', page: () => BottomNavigation()),
              GetPage(name: '/signup', page: () => SignUpPage()),
              GetPage(name: '/login', page: () => LoginPage()),
            ],
          );
        },
      ),
    );
  }
}