import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_firebase_with_hadi/provider/cart_provider.dart';
import 'package:shop_app_firebase_with_hadi/widget/custom_button.dart';

import '../../../widget/card_item.dart';

 class FullCart extends StatefulWidget {
  const FullCart({Key? key,
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  final String id;
  final String productId;
  final String name;
  final double price;
  final String image;

  @override
  State<FullCart> createState() => _FullCartState();
}

class _FullCartState extends State<FullCart> {

   @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        title: Text("Cart(${cartProvider.cartItems.length})",
        style: const TextStyle(
          color: Colors.black,
        ),),
        actions: [
          IconButton(
            onPressed: (){},
              icon: const Icon(Icons.delete_outline_outlined,
              color: Colors.black,),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)
                {
                  return CardItem();
                }),
          ),
          const Divider(
            thickness: 2,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                      height: 40,
                      width: double.infinity,
                      text: "CheckOut",
                      color: Colors.deepOrange,
                      onPress: (){},
                      radius: 20,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Text("Total : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),),
                    Text("13300054",
                      style: TextStyle(
                        fontSize: 16,
                      ),),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
