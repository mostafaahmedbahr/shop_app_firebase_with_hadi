import 'package:flutter/material.dart';
class CartModel with ChangeNotifier{
  final String? id;
  final String? image;
  final String? name;
  final num price;
  final num quantity;

  CartModel({
    required this.id,
    required this.price,
    required this.name,
    required this.image,
    required this.quantity,
  });
}
