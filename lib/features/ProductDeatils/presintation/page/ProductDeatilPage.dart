import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/core/utils/ScreenUtil.dart';
import '../../../../injection_container.dart';
import '../manager/ProductDeatil_bloc.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

class ProductDetailsPage extends StatefulWidget {
  final String id;
  ProductDetailsPage({super.key, required this.id});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ScreenUtil screenUtil = ScreenUtil();
  bool isFavorite = false;
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: BlocProvider(
        create: (context) => sl<ProductDetailsBloc>()..add(GetAllProductDetails(id: widget.id)),
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return Center(child: CircularProgressIndicator(color: AppTheme.primaryColor));
            }

            if (state is ProductDetailsLoaded) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: screenUtil.screenHeight * 0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(state.productDetailsModel.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 16,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: AppTheme.backgroundColor),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: 16,
                        child: IconButton(
                          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color:AppTheme.error),
                          onPressed: () => setState(() => isFavorite = !isFavorite),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.productDetailsModel.name, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppTheme.textSecondary)),
                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$${state.productDetailsModel.price}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.priceColor)),
                              Row(
                                children: [
                                  _buildRatingStars(state.productDetailsModel.rating),
                                  SizedBox(width: 5),
                                  Text('(${state.productDetailsModel.reviews} reviews)', style: TextStyle(fontSize: 16, color: AppTheme.textSecondary)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),

                          Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textSecondary)),
                          SizedBox(height: 8),
                          Text(state.productDetailsModel.description, style: TextStyle(fontSize: 16, color: AppTheme.buttonColor)),

                          SizedBox(height: 10),

                          Text('Category: ${state.productDetailsModel.category}', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: AppTheme.buttonColor)),
                          SizedBox(height: 16),

                          Text('Select Size:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textSecondary)),
                          SizedBox(height: 10),
                          Wrap(
                            spacing: 10,
                            children: state.productDetailsModel.sizes.map<Widget>((size) {
                              return ChoiceChip(
                                label: Text(size, style: TextStyle(fontSize: 16)),
                                selected: selectedSize == size,
                                onSelected: (isSelected) {
                                  setState(() => selectedSize = isSelected ? size : null);
                                },
                                selectedColor: AppTheme.primaryColor,
                                labelStyle: TextStyle(color: selectedSize == size ? AppTheme.backgroundColor : AppTheme.primary),
                                backgroundColor: AppTheme.backgroundColor,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center(child: Text('Error loading product details'));
          },
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            if (selectedSize == null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select a size')));
            } else {
              print('Added to cart: ${selectedSize}');
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text('Buy Now', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.backgroundColor)),
        ),
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return Icon(Icons.star, color: AppTheme.starColor, size: 22);
        } else if (hasHalfStar && index == fullStars) {
          return Icon(Icons.star_half, color: AppTheme.starColor, size: 22);
        } else {
          return Icon(Icons.star_border, color: AppTheme.starColor, size: 22);
        }
      }),
    );
  }
}

