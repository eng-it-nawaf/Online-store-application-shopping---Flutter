import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shoppe_ui/core/utils/ScreenUtil.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:shoppe_ui/features/ProductDeatils/presintation/page/ProductDeatilPage.dart';
import '../../../../injection_container.dart';
import '../manager/Home_bloc.dart';

class FeaturedSection extends StatelessWidget {
  final ScreenUtil screenUtil;

  const FeaturedSection({super.key, required this.screenUtil});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(FeaturedEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is FeaturedError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  style: TextStyle(fontSize: screenUtil.setSp(16)),
                ),
                backgroundColor: AppTheme.primaryColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is FeaturedLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            );

          } else if (state is FeaturedLoaded) {

            return Column(

              children: [
                SizedBox(height: 15),
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
                        "الأكثر شعبية",
                        style: TextStyle(
                          fontSize: screenUtil.setSp(35),
                          fontWeight: FontWeight.bold,
                          color: AppTheme.appBarColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: 5,
                  ),
                  child: SizedBox(
                    height: 200,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.4,
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        autoPlayCurve: Curves.easeInOut,
                        pauseAutoPlayOnTouch: true,
                      ),
                      items: state.productModel.map((product) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(
                                  id: product.id.toString(),
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 140,
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    ),
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          product.image,
                                          width: 140,
                                          height: 90,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              width: 140,
                                              height: 90,
                                              color: AppTheme.backgroundColor,
                                              child: Icon(
                                                Icons.image,
                                                size: 40,
                                                color: AppTheme.iconColor,
                                              ),
                                            );
                                          },
                                        ),
                                        Positioned(
                                          bottom: 4,
                                          right: 4,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 4,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.5),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: AppTheme.starColor,
                                                  size: 15,
                                                ),
                                                SizedBox(width: 1),
                                                Text(
                                                  "${product.rating}",
                                                  style: TextStyle(
                                                    color: AppTheme.backgroundColor,
                                                    fontSize: screenUtil.setSp(14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: TextStyle(
                                            fontSize: screenUtil.setSp(30),
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.primaryColor,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "\$${product.price}",
                                          style: TextStyle(
                                            fontSize: screenUtil.setSp(20),
                                            color: AppTheme.priceColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          product.description,
                                          style: TextStyle(
                                            fontSize: screenUtil.setSp(15),
                                            color: AppTheme.iconColor,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                "لا توجد بيانات متاحة",
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
