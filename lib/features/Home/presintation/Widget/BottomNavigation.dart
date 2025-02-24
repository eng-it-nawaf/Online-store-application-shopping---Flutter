import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:shoppe_ui/features/Home/presintation/page/HomePage.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.shopping_cart,
    Icons.person,
  ];

  final List<String> _titles = [
    "Home",
    "Search",
    "Cart",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });

        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      },
      items: List.generate(
        _icons.length,
            (index) => BottomNavigationBarItem(
          icon: Icon(_icons[index], size: 28),
          label: _titles[index],
        ),
      ),
      backgroundColor: AppTheme.appBarColor,
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: AppTheme.buttonColor,
    );
  }
}