import 'package:app_cart_woocomerce/models/models.dart';

class Category {
  Category({
    required this.id,
    required this.name,
    this.description,
    this.image,
  });

  int id;
  String name;
  String? description;
  ImageModel? image;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image:
            json["image"] == null ? null : ImageModel.fromMap(json["image"]));
  }
}
