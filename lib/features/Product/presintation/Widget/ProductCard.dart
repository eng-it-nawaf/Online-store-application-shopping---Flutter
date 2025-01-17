import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/AppTheme.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String reviews;
  final String image;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.reviews,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 180,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppTheme.secondaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor,
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
                image,
                height: 134,
                width: 178,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppTheme.textColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price}',
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
                      ),
                      child: const Icon(
                        Icons.add_shopping_cart,
                        color: AppTheme.secondaryColor,
                        size: 13,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16,  color: AppTheme.starColor,),
                    const SizedBox(width: 4),
                    Text(
                      reviews,
                      style: const TextStyle(fontSize: 14,  color: AppTheme.primaryColor,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}