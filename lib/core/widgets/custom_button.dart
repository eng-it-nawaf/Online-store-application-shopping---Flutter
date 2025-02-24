import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:shoppe_ui/core/ThemeProvider.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [AppTheme.appBarColor, AppTheme.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),

          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 90),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: themeProvider.isDarkMode ? AppTheme.secondaryColor : AppTheme.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}