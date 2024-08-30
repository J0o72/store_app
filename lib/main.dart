import 'package:flutter/material.dart';
import 'package:store_app/pages/categories_page.dart';
import 'package:store_app/pages/category_products.dart';
import 'package:store_app/pages/home_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "CategoryPage": (context) => const CategoriesPage(),
        "CategoryProducts": (context) => const CategoryProducts(),
      },
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
