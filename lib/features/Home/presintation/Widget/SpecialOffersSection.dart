import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/core/utils/ScreenUtil.dart';
import 'package:shoppe_ui/features/Home/data/repository/HomeRepository.dart';
import '../../../../injection_container.dart';
import '../manager/Home_bloc.dart';

class SpecialOffersSection extends StatelessWidget {
  final ScreenUtil screenUtil;

  SpecialOffersSection({required this.screenUtil});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(repository: sl<HomeRepository>())..add(FeaturedEvent()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "العروض الخاصة",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is FeaturedLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is FeaturedLoaded) {
                return Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.75, // تعديل نسبة العرض إلى الارتفاع
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.productModel.length,
                      itemBuilder: (context, index) {
                        final offer = state.productModel[index];
                        return Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              // إضافة تفاعل عند النقر على البطاقة
                              print("تم النقر على العرض: ${offer.name}");
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // الصورة مع Expanded لمنع التجاوز
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16),
                                    ),
                                    child: Image.network(
                                      offer.image,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                // تفاصيل العرض
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        offer.category,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "خصم %30",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "4.5",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            icon: Icon(
                                              Icons.favorite_border,
                                              color: Colors.grey.shade700,
                                            ),
                                            onPressed: () {
                                              print("تم إضافة العرض إلى المفضلة");
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else if (state is FeaturedError) {
                return Center(child: Text(state.errorMessage));
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}