import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/AppTheme.dart';
import 'package:shoppe_ui/features/Product/data/model/ProductModel.dart';
import 'package:shoppe_ui/features/ProductDeatils/presintation/page/ProductDeatilPage.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(id: productModel.id.toString()),
          ),
        );
      },
      splashColor: AppTheme.primaryColor.withOpacity(0.2),
      highlightColor: AppTheme.primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 155,
        height: 180,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppTheme.secondaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  productModel.image.toString(),
                  height: 134,
                  width: 178,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.error,
                        color: AppTheme.secondaryColor,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppTheme.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${productModel.price.toString()}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppTheme.priceColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // وظيفة الزر
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          minimumSize: const Size(22, 22),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.all(5),
                          splashFactory: InkRipple.splashFactory,
                        ),
                        child: const Icon(
                          Icons.add_shopping_cart,
                          color: AppTheme.secondaryColor,
                          size: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: AppTheme.starColor),
                      const SizedBox(width: 4),
                      Text(
                        productModel.reviews.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppTheme.primaryColor,
                        ),
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
  }
}
