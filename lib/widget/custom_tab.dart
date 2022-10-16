import 'package:flutter/material.dart';

import '../screens/bottom_nav_bar_screens/feeds.dart';
class CustomTab extends StatelessWidget {
    CustomTab({Key? key,required this.text,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);
Function() onTap;
final String text;
final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:   [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(iconData),
        ],
      ),
    );
  }
}
