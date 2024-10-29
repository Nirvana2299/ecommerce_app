import 'package:flutter/material.dart';

class GuestCheckoutScreen extends StatelessWidget {
  const GuestCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guest Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Shipping Address'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle checkout logic
              },
              child: const Text('Complete Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
