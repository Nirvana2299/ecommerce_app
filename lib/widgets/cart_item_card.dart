import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartItemCard({required this.product, required this.quantity, super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  product.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('Qty: $quantity'),
                    Text('\$${(product.price * quantity).toStringAsFixed(2)}'),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                cartProvider.removeFromCart(product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
