import 'package:flutter/material.dart';

class AppTheme {
  /// Colors
  static const Color primary = Color(0xFF5F53D9);
  static Color? textSecondary = Colors.grey[900];
  static const Color error = Color(0xFFFF0000);
  static const Color cancel = Color.fromRGBO(32, 31, 40, 1);
  static const Color iconBlue = Color(0xFF004CFD);
  static const Color primaryColor = Color(0xFF0288D1); // برتقالي دافئ
  static const Color secondaryColor = Color(0xFFF8F8F8); // خلفية ناعمة (رمادي فاتح)
  static const Color textColor = Color(0xFF0C0808); // نص داكن
  static const Color priceColor = Color(0xFF388E3C); // أخضر داكن للسعر
  static const Color starColor = Color(0xFFFFD54F); // أصفر للتقييمات
  static const Color iconColor = Color(0xFF757575); // أيقونات غير محددة (رمادي)
  static const Color appBarColor = Color(0xFF1A237E); // شريط التطبيقات (أزرق داكن)
  static const Color buttonColor = Color(0xFF0288D1); // زر اللون الأزرق الفاتح
  static const Color backgroundColor = Color(0xFFF3F4F6); // خلفية عامة (رمادي فاتح)

  static MaterialColor primaarySwatch = MaterialColor(Color(0xFFDC6465).value, {
    50: const Color(0xFFDC6465).withOpacity(.05),
    100: const Color(0xFFDC6465).withOpacity(.1),
    200: const Color(0xFFDC6465).withOpacity(.2),
    300: const Color(0xFFDC6465).withOpacity(.3),
    400: const Color(0xFFDC6465).withOpacity(.4),
    500: const Color(0xFFDC6465).withOpacity(.5),
    600: const Color(0xFFDC6465).withOpacity(.6),
    700: const Color(0xFFDC6465).withOpacity(.7),
    800: const Color(0xFFDC6465).withOpacity(.8),
    900: const Color(0xFFDC6465).withOpacity(.9)
  });

  static MaterialColor secondarySwitch = MaterialColor(Color(0xFFFFFFFF).value, {
    50: const Color(0xFFFFFFFF).withOpacity(.05),
    100: const Color(0xFFFFFFFF).withOpacity(.1),
    200: const Color(0xFFFFFFFF).withOpacity(.2),
    300: const Color(0xFFFFFFFF).withOpacity(.3),
    400: const Color(0xFFFFFFFF).withOpacity(.4),
    500: const Color(0xFFFFFFFF).withOpacity(.5),
    600: const Color(0xFFFFFFFF).withOpacity(.6),
    700: const Color(0xFFFFFFFF).withOpacity(.7),
    800: const Color(0xFFFFFFFF).withOpacity(.8),
    900: const Color(0xFFFFFFFF).withOpacity(.9)
  });

  static Color scaffoldBackgroundColor = Color(0xffFFFFFF);
  static Color scaffoldBackgroundColor2 = Color(0xffF6F9FF);

  static String fontFamily = 'Roboto';

  static TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 18.0,
      fontFamily: fontFamily,
      color: Colors.brown,
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      fontFamily: fontFamily,
      color: Colors.brown,
    ),
    displaySmall: TextStyle(
      fontSize: 14,
      fontFamily: fontFamily,
      color: Colors.brown,
    ),
    headlineMedium: TextStyle(
      fontSize: 14,
      fontFamily: fontFamily,
      color: AppTheme.primaryColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 12.0,
      fontFamily: fontFamily,
      color: Colors.brown,
    ),
    titleLarge: TextStyle(
      fontSize: 12.0,
      fontFamily: fontFamily,
      color: AppTheme.primaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontFamily: fontFamily,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 20.0,
      fontFamily: fontFamily,
      color: Colors.white,
    ),
  );

  /// تعريف الثيمات
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    colorScheme: ColorScheme.light(
      primary: primary,
      secondary: secondaryColor,
      background: backgroundColor,
    ),
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      color: appBarColor,
      titleTextStyle: textTheme.titleLarge,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: buttonColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    colorScheme: ColorScheme.dark(
      primary: primary,
      secondary: secondaryColor,
      background: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: textTheme.copyWith(
      bodyLarge: textTheme.bodyLarge!.copyWith(color: Colors.white),
      bodyMedium: textTheme.bodyMedium!.copyWith(color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      color: appBarColor,
      titleTextStyle: textTheme.titleLarge,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: buttonColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}