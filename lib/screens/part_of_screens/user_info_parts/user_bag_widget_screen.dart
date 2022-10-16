import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/list_tile_widget.dart';
import '../../../widget/text_title_widget.dart';
import '../../wish_list/empty_wish_list_screen.dart';
import '../../wish_list/wish_list.dart';
class UserBagWidgetScreen extends StatelessWidget {
  const UserBagWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:   [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextTitleWidget(
              titleText: "User Bag",
            ),
          ),
        ),
        const  Divider(
          thickness: 1,
        ),
        ListTileWidget(
          widget: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)
              {
                return WishListScreen();
              }));
            },
            icon:const Icon(Icons.arrow_forward_outlined),
          ),
          title: "WishList",
          subTitle: "sub",
          icon: Icons.favorite_border,
        ),
        ListTileWidget(
          widget: IconButton(
            onPressed: (){},
            icon:const Icon(Icons.arrow_forward_outlined),
          ),
          title: "Cart",
          subTitle: "sub",
          icon: Icons.shopping_cart_checkout_outlined,
        ),
        ListTileWidget(
          widget: IconButton(
            onPressed: (){},
            icon:const Icon(Icons.arrow_forward_outlined),
          ),
          title: "My Orders",
          subTitle: "sub",
          icon: CupertinoIcons.bag,
        ),

      ],
    );
  }
}
