import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.image, fit: BoxFit.cover, height: 90, width: double.infinity,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('\$${product.price.toStringAsFixed(2)}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  cartProvider.addToCart(product);
                },
                child: const Text('Add to Cart'),
              ),
              IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () {
                  cartProvider.removeFromCart(product);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
