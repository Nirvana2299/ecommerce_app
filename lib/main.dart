import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => const SignInScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}

