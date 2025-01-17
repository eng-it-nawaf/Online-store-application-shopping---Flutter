import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:shoppe_ui/features/Product/presintation/page/productsPage.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

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
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppTheme.secondaryColor,
      selectedItemColor: AppTheme.priceColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: _icons.asMap().entries.map((entry) {
        int index = entry.key;
        IconData icon = entry.value;

        return BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(icon, size: 28),
              if (index == 2)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: AppTheme.secondaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          label: _titles[index],
        );
      }).toList(),
    );
  }
}
