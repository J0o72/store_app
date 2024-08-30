import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 2,
              ),
            ],
          ),
          child: Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    product.title,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -40,
          right: 0,
          child: Container(
            height: 100,
            width: 100,
            child: Image.network(product.image),
          ),
        )
      ],
    );
  }
}
