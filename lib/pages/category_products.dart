import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_category_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: GetGategoryService().getCategory(categoryName: categoryName),
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
