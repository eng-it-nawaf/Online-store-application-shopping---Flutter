import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_ui/core/utils/ScreenUtil.dart';
import 'package:shoppe_ui/core/widgets/CustomAppBar.dart';
import 'package:shoppe_ui/features/Product/presintation/Widget/BottomNavigation.dart';
import '../../../../injection_container.dart';
import '../Widget/ProductCard.dart';
import '../manager/Product_bloc.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ScrollController _scrollController;
  List<Map<String, dynamic>> filterList = [];

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

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: CustomAppBar(
        title: " المنتجــات",
      ),
      body: BlocProvider(
        create: (context) => sl<ProductBloc>(),
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductError) {
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
                padding: EdgeInsets.all(screenUtil.setWidth(10)), // padding
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenUtil.screenWidth > 600 ? 3 : 2,
                  crossAxisSpacing: screenUtil.setWidth(10),
                  mainAxisSpacing: screenUtil.setWidth(10),
                  childAspectRatio: 0.75,
                ),
                itemCount: state.productModel.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    productModel: state.productModel[index],
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
                      size: screenUtil.setHeight(100),
                      color: AppTheme.starColor,
                    ),
                    SizedBox(height: screenUtil.setHeight(20)),
                    Text(
                      "حدث خطأ أثناء تحميل البيانات",
                      style: TextStyle(
                        fontSize: screenUtil.setSp(18),
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
