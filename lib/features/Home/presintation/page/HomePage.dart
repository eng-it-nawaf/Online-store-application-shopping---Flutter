import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/utils/ScreenUtil.dart';
import 'package:shoppe_ui/core/widgets/CustomAppBar.dart';
import 'package:shoppe_ui/features/Home/presintation/Widget/CarouselSection.dart';
import 'package:shoppe_ui/features/Home/presintation/Widget/CategoriesSection.dart';
import 'package:shoppe_ui/features/Home/presintation/Widget/FeaturedSection.dart';
import 'package:shoppe_ui/features/Home/presintation/Widget/SpecialOffersSection.dart';
import 'package:shoppe_ui/features/Product/presintation/Widget/BottomNavigation.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  late ScreenUtil screenUtil;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    screenUtil = ScreenUtil();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: CustomAppBar(
        title: "الرئيسية",
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildSearchBar(),
            ),
            CarouselSection(screenUtil: screenUtil),
            CategoriesSection(screenUtil: screenUtil),
            FeaturedSection(screenUtil: screenUtil),
            SpecialOffersSection(screenUtil: screenUtil), // إضافة قسم العروض الخاصة

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: _onSearch,
        decoration: InputDecoration(
          hintText: "ابحث عن منتج...",
          border: InputBorder.none,
          icon: Icon(Icons.search, color: AppTheme.primaryColor),
          hintStyle: TextStyle(color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
