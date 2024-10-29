Flutter E-Commerce App
A simple e-commerce application built with Flutter, showcasing product listings, a shopping cart, and search functionality. Users can search for products, filter results, and add items to their cart for checkout.

Features
Product Listings: Displays products fetched from a mock API.
Search Functionality: Users can search for products by name.
Sorting and Filtering: Products can be sorted by price (low to high, high to low) and alphabetical order.
Shopping Cart: Users can add products to their cart, see the quantity of each product, and navigate to a cart screen.
Responsive Design: The app is designed to work well on both mobile and tablet devices.
Getting Started
Prerequisites
Flutter SDK installed on your machine.
An IDE like Android Studio, Visual Studio Code, or IntelliJ IDEA.

Installation
1. Clone the repository:
git clone https://github.com/yourusername/ecommerce_app.git
cd ecommerce_app

2. Install dependencies:
   flutter pub get
3.Run the app:
flutter run

Project Structure
lib/
├── models/
│   └── product.dart          # Product model
├── providers/
│   └── cart_provider.dart     # Cart state management
├── services/
│   └── api_service.dart       # API calls
├── screens/
│   ├── home_screen.dart       # Home screen with product listings
│   └── cart_screen.dart       # Cart screen to view added items
├── widgets/
│   └── product_card.dart       # Widget to display individual product
└── main.dart                  # Entry point of the application

API Used
The app fetches product data from the Fake Store API, which provides a simple way to access product data.

Usage
1. Open the app, and you will see a login Screen (For login in use username: 'johnd', password: 'm38rmF$' or you call userlist API from postman URL: 'https://fakestoreapi.com/users/')
2. Once you login you will see a list of products
3. Use the search bar to find specific products.
4. Filter and sort the product list as needed.
5. Add products to your cart and view them by clicking the cart icon in the app bar.

Contributing
Contributions are welcome! If you have suggestions for improvements or new features, please open an issue or submit a pull request.
