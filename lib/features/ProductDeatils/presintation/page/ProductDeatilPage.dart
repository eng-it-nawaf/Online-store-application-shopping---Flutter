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
  ScrollController _scrollController = ScrollController();
  ScreenUtil screenUtil = ScreenUtil();
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      body: BlocProvider(
        create: (context) => sl<ProductDetailsBloc>(),
        child: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
          listener: (context, state) {
            if (state is ProductDetailsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            if (state is ProductDetailsInitial) {
              BlocProvider.of<ProductDetailsBloc>(context)
                  .add(GetAllProductDetails(id: widget.id));
            }

            if (state is ProductDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is ProductDetailsLoaded) {
              return _buildProductDetails(state);
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildProductDetails(ProductDetailsLoaded state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: screenUtil.screenHeight * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(state.productDetailsModel.image),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(Icons.arrow_back, color: AppTheme.textColor,),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.productDetailsModel.name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textColor,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '\$${state.productDetailsModel.price}',
                      style: TextStyle(
                        fontSize: 26,
                        color: AppTheme.priceColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppTheme.starColor, size: 24),
                        SizedBox(width: 5),
                        Text(
                          '${state.productDetailsModel.rating}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' (${state.productDetailsModel.reviews} reviews)',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  state.productDetailsModel.description,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Category: ${state.productDetailsModel.category}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // إضافة المنتج إلى السلة
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart, color: AppTheme.secondaryColor),
                        SizedBox(width: 10),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppTheme.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isFavorite ? AppTheme.primarySwatch  : AppTheme.secondaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.white : Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
