import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shoppe_ui/core/utils/ScreenUtil.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import '../../../../injection_container.dart';
import '../manager/Home_bloc.dart';

class CarouselSection extends StatelessWidget {
  final ScreenUtil screenUtil;

  const CarouselSection({super.key, required this.screenUtil});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(CarouselEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is CarouselError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  style: TextStyle(
                    fontSize: screenUtil.setSp(16),
                  ),
                ),
                backgroundColor: AppTheme.primaryColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CarouselLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            );
          } else if (state is CarouselLoaded) {
            return Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.3,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                  ),
                  items: state.carouselModel.map((i) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            i.image,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.transparent
                                ],
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.bottomLeft,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
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