import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:shoppe_ui/core/ThemeProvider.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final IconData prefixIcon;
  final VoidCallback? onSuffixIconPressed;
  final bool showSuffixIcon;
  final FocusNode? focusNode; // إضافة focusNode


  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    required this.prefixIcon,
    this.onSuffixIconPressed,
    this.showSuffixIcon = false,
    this.focusNode, // إضافة focusNode

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          color: themeProvider.isDarkMode ? AppTheme.secondaryColor : AppTheme.textColor,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: themeProvider.isDarkMode ? AppTheme.secondaryColor : AppTheme.primaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: themeProvider.isDarkMode ? AppTheme.iconColor : AppTheme.backgroundColor,
          prefixIcon: Icon(prefixIcon, color: themeProvider.isDarkMode ? AppTheme.secondaryColor : AppTheme.primaryColor),
          suffixIcon: showSuffixIcon
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: themeProvider.isDarkMode ? AppTheme.secondaryColor : AppTheme.primaryColor,
            ),
            onPressed: onSuffixIconPressed,
          )
              : null,
        ),
      ),
    );
  }
}