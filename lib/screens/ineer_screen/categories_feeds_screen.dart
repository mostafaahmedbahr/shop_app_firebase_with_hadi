import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_firebase_with_hadi/models/product_model.dart';

import '../../provider/product_provider.dart';
import '../../widget/feeds_products.dart';
import 'package:badges/badges.dart';

class CategoriesFeedsScreen extends StatelessWidget {
  final String appBarTitle;
  const CategoriesFeedsScreen({Key? key , required this.appBarTitle}) : super(key: key);
  static const routeName = '/FeedsScreen';
  @override
  Widget build(BuildContext context) {
    final productPro = Provider.of<ProductsProvider>(context,listen: true);
    final categoryName = ModalRoute.of(context)!.settings.arguments.toString();
    print("---------");
    print("name = $categoryName");
    print("name = $appBarTitle");
    print("---------");
     final productsList = productPro.findByCategory(categoryName);
     print(productsList.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
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
              child: const FeedProducts(
              ),
            );
          }),
        ),
      ),
    );
  }
}

