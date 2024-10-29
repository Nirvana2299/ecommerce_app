import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: FutureBuilder(
        future: ApiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final products = snapshot.data ?? [];
          return products.isNotEmpty  ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ) : const Center(child: Text('No Data'));
        },
      ),
    );
  }
}
