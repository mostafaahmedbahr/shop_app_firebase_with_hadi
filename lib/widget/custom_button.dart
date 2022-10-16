import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
    CustomButton({Key? key,
      required this.height,
      required  this.width,
      required this.text,
      required this.color,
      required this.onPress,
      required this.radius,
    }) : super(key: key);
final double height;
  final double width;
  final Color color;
  final String text;
  final double radius;
  Function() onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
          onPressed: (){},
          child: Text(text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),),
      ),
    );
  }
}
