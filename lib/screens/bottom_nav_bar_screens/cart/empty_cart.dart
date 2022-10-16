 import 'package:flutter/material.dart';

import '../../../widget/custom_button.dart';

 class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 30,),
            Image.asset("assets/images/emptycart.png"),
            Column(
              children: [
                const Text("Your Card Is Empty",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),),
                const SizedBox(height: 15,),
                Text("Looks like you have\'t add any item to your card yet !",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                textAlign: TextAlign.center,),
              ],
            ),
            CustomButton(
              height: 50,
              width: double.infinity,
              color: Colors.deepOrange,
              text: "Shop Now",
              radius: 5,
              onPress: (){},
            ),
          ],
        ),
      ),
    );
  }
}
