import 'package:flutter/material.dart';
  import 'package:shop_app_firebase_with_hadi/screens/wish_list/empty_wish_list_screen.dart';
import 'package:shop_app_firebase_with_hadi/screens/wish_list/full_wish_list.dart';
class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    List wishList = [];
    return Scaffold(
      body: wishList.isNotEmpty ? const EmptyWishListScreen() : const FullWishListScreen(),
    );
  }
}
