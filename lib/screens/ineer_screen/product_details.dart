
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_firebase_with_hadi/provider/product_provider.dart';
import 'package:shop_app_firebase_with_hadi/screens/bottom_nav_bar_screens/cart/cart_screen.dart';
import 'package:shop_app_firebase_with_hadi/screens/wish_list/wish_list.dart';

import '../../consts/colors.dart';
 import '../../models/product_model.dart';
import '../../provider/cart_provider.dart';
import '../../provider/dark_theme_provider.dart';
import '../../widget/feeds_products.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/ProductDetails';

  ProductDetails({Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.isFav,
  }) : super(key: key);
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  final int? quantity;
  final bool? isFav;


  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  GlobalKey previewContainer =   GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
     final productProvider = Provider.of<ProductsProvider>(context);
    var list = productProvider.productsList;
     // final productId = ModalRoute.of(context)?.settings.arguments as String;
     // final prodAttr = productsData.findById(productId);
    // final productsList = productsData.products;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(
              '${widget.imageUrl}',
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child:const Padding(
                            padding:   EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.save,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child:const Padding(
                            padding:   EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.share,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //padding: const EdgeInsets.all(16.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child:  Text(
                                '${widget.title}',
                                maxLines: 2,
                                style:const TextStyle(
                                  // color: Theme.of(context).textSelectionColor,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'US \$ ${widget.price}',
                              style: TextStyle(
                                  color: themeState.darkTheme
                                      ? Theme.of(context).disabledColor
                                      : ColorsConsts.subTitle,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.0),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 3.0),
                      const Padding(
                        padding:   EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          '${widget.description}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 21.0,
                            color: themeState.darkTheme
                                ? Theme.of(context).disabledColor
                                : ColorsConsts.subTitle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      const Padding(
                        padding:   EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      _details(themeState.darkTheme, 'Brand: ', 'BrandName'),
                      _details(themeState.darkTheme, 'Quantity: ', '${widget.quantity}'),
                      _details(themeState.darkTheme, 'Category: ', '${widget.quantity}'),
                      _details(themeState.darkTheme, 'Popularity: ', '${widget.isFav}'),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),

                      // const SizedBox(height: 15.0),
                      Container(
                        color: Theme.of(context).backgroundColor,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'No reviews yet',
                                style: TextStyle(
                                    color: Theme.of(context).textSelectionColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 21.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Be the first review!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  color: themeState.darkTheme
                                      ? Theme.of(context).disabledColor
                                      : ColorsConsts.subTitle,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 15.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Text(
                    'Suggested products:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    width: double.infinity,
                    height: 300,
                    child: ListView.builder(
                      itemCount: list.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Row(
                          children: [
                             FeedProducts(
                                 description: list[index].description,
                                 price: list[index].price,
                                 imageUrl: list[index].imageUrl,
                                 quantity: list[index].quantity,
                                 id:list[index].id,
                               isFav:list[index].isFav,
                               title:list[index].title,
                             ),
                            const SizedBox(width: 10,),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  "DETAIL",
                  style:
                  TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.list_alt_rounded,
                      color: ColorsConsts.favColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)
                      {
                        return const WishListScreen();
                      }));                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: ColorsConsts.cartColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)
                      {
                        return const CartScreen();
                      }));
                    },
                  ),
                ]),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(side: BorderSide.none),
                       primary: Colors.redAccent.shade400,
                     ),
                      onPressed: () {
                       cartProvider.addProductToCart(
                         "${widget.id}",
                         "${widget.title}",
                         widget.price as double,
                         "${widget.imageUrl}",
                       );
                      },
                      child: Text(
                        'Add to Cart'.toUpperCase(),
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         shape: const RoundedRectangleBorder(side: BorderSide.none),
                         primary: Theme.of(context).backgroundColor,
                       ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Buy now'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).textSelectionColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.payment,
                            color: Colors.green.shade700,
                            size: 19,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: themeState.darkTheme
                        ? Theme.of(context).disabledColor
                        : ColorsConsts.subTitle,
                    height: 50,
                    child: InkWell(
                      splashColor: ColorsConsts.favColor,
                      onTap: () {},
                      child: Center(
                        child: Icon(
                         Icons.list_alt,
                          color: ColorsConsts.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ]))
        ],
      ),
    );
  }

  Widget _details(bool themeState, String title, String info) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 21.0),
          ),
          Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.0,
              color: themeState
                  ? Theme.of(context).disabledColor
                  : ColorsConsts.subTitle,
            ),
          ),
        ],
      ),
    );
  }
}
