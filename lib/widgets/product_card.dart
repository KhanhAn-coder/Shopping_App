import 'package:flutter/material.dart';
class ProductCart extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductCart(
      {
        super.key,
        required this.title,
        required this.price,
        required this.image,
        required this.backgroundColor
      }
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration:  BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "\$$price ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,

            ),
          ),
          const SizedBox(height: 5),
          Center(child: Image.asset(image, height: 175,)),
        ],
      ),
    );
  }
}
