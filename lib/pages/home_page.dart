import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_products_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Trend"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'CategoryPage');
            },
            icon: const Icon(Icons.category),
          ),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: AllProductsService().getAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
            return GridView.builder(
              clipBehavior: Clip.none,
              itemCount: products.length,
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 60,
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                  product: products[index],
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
