import 'package:flutter/cupertino.dart';

class ProductModel with ChangeNotifier{
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  final String? productCategoryName;
  final String? brand;
  final int? quantity;
  final bool? isFav;
  final bool? isPopular;

  ProductModel({
      required this.title,
  required this.description,
  required this.price,
  required this.imageUrl,
  required this.productCategoryName,
  required this.brand,
  required this.quantity,
    this.isFav,
  required this.isPopular,
    required this.id,
  });
}
