import 'package:flutter/material.dart';
import 'package:shop_app_firebase_with_hadi/models/cart_model.dart';
class CartProvider with ChangeNotifier
{
  Map<String,CartModel> cartItems = {};
  Map<String,CartModel> get getCartItems{
    return cartItems;
  }

  double get totalAmount
  {
    var total = 0.0;
    cartItems.forEach((key, value) {total+=value.price+value.quantity;});
    return total;
  }

  void addProductToCart(String productId , String name , double price   , String imageUrl)
  {
    if(cartItems.containsKey(productId))
    {
      cartItems.update(productId, (value) => CartModel(
          id: value.id,
          price: value.price,
          name: value.name,
          image: value.image,
          quantity: value.quantity + 1,
      ));
    }
    else
    {
      cartItems.putIfAbsent(productId, () =>CartModel(
          id: DateTime.now().toString(),
          price: price,
          name: name,
          image: imageUrl,
          quantity: 1,
      ));
    }
    notifyListeners();
  }
}