import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'guest_checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final product = cartProvider.cartItems[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      cartProvider.removeFromCart(product);
                    },
                  ),
                );
              },
            ),
          ),
          Text('Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}'),
          ElevatedButton(
            onPressed: () {
              // Navigate to guest checkout page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const GuestCheckoutScreen()),
              );
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
