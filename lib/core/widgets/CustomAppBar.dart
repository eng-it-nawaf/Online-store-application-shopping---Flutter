import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: AppTheme.secondaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppTheme.priceColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      actions: actions,
      iconTheme: IconThemeData(color: AppTheme.secondaryColor,),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}