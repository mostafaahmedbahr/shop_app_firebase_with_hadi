import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_firebase_with_hadi/models/product_model.dart';

 import '../../provider/product_provider.dart';
import '../../widget/feeds_products.dart';
import 'package:badges/badges.dart';

 class FeedsScreen extends StatelessWidget {
   final String appBarTitle;
  const FeedsScreen({Key? key , required this.appBarTitle}) : super(key: key);
  static const routeName = '/FeedsScreen';
  @override
  Widget build(BuildContext context) {
    final productPro = Provider.of<ProductsProvider>(context);
    List productsList = productPro.productsList;
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          Badge(
            badgeContent: const Text('3'),
            child: const Icon(Icons.settings),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240/400,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(productsList.length, (index)
          {
            return ChangeNotifierProvider<ProductModel>.value(
              value: productsList[index],
              child: FeedProducts(
              ),
            );
          }),
        ),
      ),
    );
  }
}

