import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _allProducts = [];
  List<dynamic> _filteredProducts = [];
  String _searchQuery = '';
  String _selectedSortOption = 'Price: Low to High';

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final products = await ApiService.fetchProducts();
    setState(() {
      _allProducts = products;
      _filteredProducts = products;
    });
  }

  void _searchProducts(String query) {
    setState(() {
      _searchQuery = query;
      _filteredProducts = _allProducts
          .where((product) => product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _sortProducts();
    });
  }

  void _sortProducts() {
    if (_selectedSortOption == 'Price: Low to High') {
      _filteredProducts.sort((a, b) => a.price.compareTo(b.price));
    } else if (_selectedSortOption == 'Price: High to Low') {
      _filteredProducts.sort((a, b) => b.price.compareTo(a.price));
    } else if (_selectedSortOption == 'Alphabetical') {
      _filteredProducts.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void _openFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sort Products'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: const Text('Price: Low to High'),
                value: 'Price: Low to High',
                groupValue: _selectedSortOption,
                onChanged: (value) {
                  setState(() {
                    _selectedSortOption = value!;
                    _sortProducts();
                  });
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                title: const Text('Price: High to Low'),
                value: 'Price: High to Low',
                groupValue: _selectedSortOption,
                onChanged: (value) {
                  setState(() {
                    _selectedSortOption = value!;
                    _sortProducts();
                  });
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                title: const Text('Alphabetical'),
                value: 'Alphabetical',
                groupValue: _selectedSortOption,
                onChanged: (value) {
                  setState(() {
                    _selectedSortOption = value!;
                    _sortProducts();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _openFilterDialog(context), // Open filter dialog
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: TextField(
              onChanged: _searchProducts,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Implement search button functionality if needed
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: _filteredProducts.isNotEmpty
          ? ListView.builder(
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2, // Change to your desired number of columns
        //   childAspectRatio: 0.8, // Adjust the aspect ratio if needed
        // ),
        itemCount: _filteredProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(product: _filteredProducts[index]);
        },
      )
          : const Center(child: Text('No Data')),
    );
  }
}
