import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/core/utils/ScreenUtil.dart';
import 'package:shoppe_ui/core/widgets/CustomAppBar.dart';
import 'package:shoppe_ui/features/Product/presintation/Widget/BottomNavigation.dart';
import 'package:shoppe_ui/features/Product/presintation/page/ProductSearch.dart';
import '../../../../injection_container.dart';
import '../Widget/ProductCard.dart';
import '../manager/Product_bloc.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:shoppe_ui/features/Product/data/model/ProductModel.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ScrollController _scrollController;
  List<Map<String, dynamic>> filterList = [
    {"name": "الدول المناصرة للقضية", "id": 4},
    {"name": "الدول الداعمة للقضية", "id": 3},
    {"name": "الدول الداعمة للاحتلال", "id": 2},
    {"name": "الدول المحايدة", "id": 1},
  ];

  int itemIsSelected = 0;
  String valueInput = "";
  Widget productWidget = Container();
  late ScreenUtil screenUtil;

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

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      appBar: CustomAppBar(
        title: "Product",
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppTheme.secondaryColor),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(
                  products: context.read<ProductBloc>().state is ProductLoaded
                      ? (context.read<ProductBloc>().state as ProductLoaded)
                      .productModel
                      : [],
                ),
              );
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => sl<ProductBloc>(),
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: AppTheme.priceColor,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ProductInitial) {
              BlocProvider.of<ProductBloc>(context).add(GetAllProduct());
            }

            if (state is ProductLoading) {
              productWidget = Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                ),
              );
            }

            if (state is ProductLoaded) {
              return GridView.builder(
                padding: EdgeInsets.all(screenWidth * 0.02), 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 600 ? 3 : 2, 
                  crossAxisSpacing: screenWidth * 0.02, 
                  mainAxisSpacing: screenWidth * 0.02,
                  childAspectRatio: 0.75, 
                ),
                itemCount: state.productModel.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    name: state.productModel[index].name,
                    reviews: state.productModel[index].reviews.toString(),
                    price: state.productModel[index].price.toString(),
                    image: state.productModel[index].image,
                  );
                },
              );
            }

            if (state is ProductError) {
              productWidget = Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: screenHeight * 0.1, 
                      color: AppTheme.starColor,
                    ),
                    SizedBox(height: screenHeight * 0.02), 
                    Text(
                      "حدث خطأ أثناء تحميل البيانات",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04, 
                        color: AppTheme.primarySwatch,
                      ),
                    ),
                  ],
                ),
              );
            }

            return productWidget;
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}


