import 'package:flutter/material.dart';
class TextTitleWidget extends StatelessWidget {
  const TextTitleWidget({Key? key,
    required this.titleText,
  }) : super(key: key);

  final String titleText;
  @override
  Widget build(BuildContext context) {
    return   Text(titleText,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),);
  }
}
