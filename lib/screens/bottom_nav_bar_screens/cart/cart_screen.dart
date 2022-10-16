 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_firebase_with_hadi/screens/bottom_nav_bar_screens/cart/empty_cart.dart';
import 'package:shop_app_firebase_with_hadi/screens/bottom_nav_bar_screens/cart/full_cart.dart';

import '../../../provider/cart_provider.dart';
  class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: cartProvider.cartItems.isEmpty ? const EmptyCartScreen() :  Expanded(
        child: ListView.builder(
            itemCount: cartProvider.cartItems.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index)
            {
              return FullCart(
                  id: cartProvider.cartItems.values.toList()[index].id.toString(),
                  productId: cartProvider.cartItems.keys.toList()[index],
                  name: cartProvider.cartItems.values.toList()[index].name.toString(),
                  price: cartProvider.cartItems.values.toList()[index].price.toDouble(),
                  image: cartProvider.cartItems.values.toList()[index].image.toString(),
              );
            }),
      ),
        //

    );
  }
}
