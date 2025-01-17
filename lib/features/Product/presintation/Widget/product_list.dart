import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shoppe_ui/features/Product/presintation/Widget/ProductCard.dart';
import 'package:shoppe_ui/features/Product/data/model/ProductModel.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> products;

  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    log("Products in ProductList: ${products.length} items");
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        log("Product ${index + 1}: ${products[index].name}");
        return ProductCard(
          name: products[index].name,
          price: products[index].price.toString(),
          reviews: products[index].reviews.toString(),
          image: products[index].image,
        );
      },
    );
  }
}