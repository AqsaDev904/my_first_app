import 'dart:convert';

class ProductModel {
  String title = "";
  String subtitle = "";
  double price = 0.0;

ProductModel({
  required this.title,
  required this.subtitle,
  required this.price,
});
factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
    subtitle: json['subtitle'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
    );
  }
}

