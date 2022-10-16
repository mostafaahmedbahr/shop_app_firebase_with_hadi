import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_firebase_with_hadi/models/product_model.dart';

 import '../provider/product_provider.dart';
import '../screens/ineer_screen/product_details.dart';

class FeedProducts extends StatefulWidget {
  const FeedProducts({Key? key, description, price, imageUrl, id, quantity, title, isFav}) : super(key: key);

  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    final productPro = Provider.of<ProductModel>(context);
    return InkWell(
      onTap: ()
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)
        {
          return ProductDetails(
              id: productPro.id,
              title: productPro.title,
              description: productPro.description,
              price: productPro.price,
              imageUrl: productPro.imageUrl,
              quantity:productPro. quantity,
              isFav: productPro.isFav,
          );
        }));
      },
      child: Container(
        width: 250,
        height: 290,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Theme.of(context).backgroundColor),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                        minHeight: 100,
                        maxHeight: MediaQuery.of(context).size.height * 0.3),
                    child: Image.network(
                      "${productPro.imageUrl}",
                      fit: BoxFit.fitWidth,
                      height: 150,
                    ),
                  ),
                ),
                Badge(
                  toAnimate: true,
                  shape: BadgeShape.square,
                  badgeColor: Colors.deepOrange,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                  ),
                  badgeContent: const Text('NEW',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(left: 5, bottom: 2, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                   Text(
                    '${productPro.description}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style:const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '\$ ${productPro.price}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        'Quantity: ${productPro.quantity}',
                        style:const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600),
                      ),
                      Material(color: Colors.transparent,
                        child: InkWell(
                            onTap: (){},
                            borderRadius: BorderRadius.circular(18.0),
                            child: const Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                            )
                        ),)
                    ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
