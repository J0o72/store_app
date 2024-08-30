import 'package:flutter/material.dart';
import 'package:store_app/services/all_categories_service.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: AllCategoriesService().getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> categoriesName = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: categoriesName.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // print(categoriesName[index]);
                    Navigator.pushNamed(context, "CategoryProducts",
                        arguments: categoriesName[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                        child: Text(
                      categoriesName[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
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
