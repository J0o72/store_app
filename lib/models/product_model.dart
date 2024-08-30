import 'package:store_app/models/rating_model.dart';

class ProductModel {
  int id;
  String title, price, description, category, image;
  RatingModel? rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.rating,
      required this.description,
      required this.image});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'].toString(),
        category: jsonData['category'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: jsonData['rating'] == null
            ? null
            : RatingModel.fromJson(jsonData['rating']));
  }
}
