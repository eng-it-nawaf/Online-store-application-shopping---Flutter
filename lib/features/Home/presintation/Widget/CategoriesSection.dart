import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/core/utils/ScreenUtil.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import '../../../../injection_container.dart';
import '../manager/Home_bloc.dart';

class CategoriesSection extends StatelessWidget {
  final ScreenUtil screenUtil;

  const CategoriesSection({super.key, required this.screenUtil});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(CategoriesEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is CategoriesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? "حدث خطأ ما",
                  style: TextStyle(fontSize: screenUtil.setSp(16)),
                ),
                backgroundColor: AppTheme.primaryColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return SkeletonLoader(
              builder: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: AppTheme.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 10.0,
                            color: AppTheme.backgroundColor,
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: double.infinity,
                            height: 10.0,
                            color: AppTheme.backgroundColor,
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 100.0,
                            height: 10.0,
                            color: AppTheme.backgroundColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              items: 5,
              period: Duration(seconds: 2),
            );
          } else if (state is CategoriesLoaded) {
            return Column(
              children: [

                Divider(
                  color: AppTheme.primary,
                  thickness: 2,
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/product');
                        },
                        child: Text(
                          "عـرض الكــل",
                          style: TextStyle(
                            fontSize: screenUtil.setSp(30),
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                      Text(
                        "الفئــات",
                        style: TextStyle(
                          fontSize: screenUtil.setSp(35),
                          fontWeight: FontWeight.bold,
                          color: AppTheme.appBarColor,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 5),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: state.categoriesModel.length,
                    itemBuilder: (context, index) {
                      final category = state.categoriesModel[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () {

                          },
                          child: Container(
                            width: 140,
                            decoration: BoxDecoration(
                              color: AppTheme.backgroundColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    category.image ?? "https://via.placeholder.com/150",
                                    width: 140,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    category.name ?? "No Name",
                                    style: TextStyle(
                                      fontSize: screenUtil.setSp(28),
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.textColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

              ],
            );
          } else {
            return Center(
              child: Text(
                "لا توجد بيانات متاحة حال",
                style: TextStyle(
                  fontSize: screenUtil.setSp(18),
                  color: AppTheme.error,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
