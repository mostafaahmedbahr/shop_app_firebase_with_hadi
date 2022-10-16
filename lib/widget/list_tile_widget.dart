

import 'package:flutter/material.dart';
 import 'package:shop_app_firebase_with_hadi/consts/dark_theme.dart';

 class ListTileWidget extends StatelessWidget {
  const ListTileWidget({Key? key,
    // required this.onTap,
    required this.title,
    required this.subTitle,required this.icon, this.widget,
  }) : super(key: key);
  // final VoidCallback? onTap;
  final String title;
  final String subTitle;
  final IconData icon;
  final Widget? widget;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          trailing: widget,
          onTap: (){},
          title:   Text(title),
          subtitle:   Text(subTitle),
          leading: IconButton(
            onPressed: (){},
            icon:   Icon(icon),
          ),
        ),
      ),
    );
  }
}
