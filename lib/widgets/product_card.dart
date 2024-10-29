import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Improved image handling
            ClipRRect(
              borderRadius: BorderRadius.circular(8), // Rounded image corners
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                height: 60,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 8),
            // Title with overflow handling
            Text(
              product.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Price display
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 14, color: Colors.green),
            ),
            const SizedBox(height: 8),
            // Add to cart button
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addToCart(product);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40), // Full-width button
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
