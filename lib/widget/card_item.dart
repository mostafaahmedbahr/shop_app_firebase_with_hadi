import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
class CardItem extends StatefulWidget {
  const CardItem({Key? key}) : super(key: key);

  @override
  State<CardItem> createState() => _CardItemState();
}
var number = 0;

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: SizedBox(
        height: 120,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 120,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU",
                  fit: BoxFit.cover,
                  width: 120,),
                ),
              ),
              const SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text("monitor 2 ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                       SizedBox(width: 90,),
                        InkWell(

                          child: Icon(Icons.clear,
                          color: Colors.red,),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text("Price : "),
                            Text("5000",
                            style: TextStyle(
                              color: Colors.purple,
                            ),),
                          ],
                        ),
                        Row(
                          children: const [
                            Text("Sub Total : "),
                            Text("\$5001421",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),),
                          ],
                        ),
                      ],
                    ),
                    Row(
                       children: [
                        const Text("Ships Free ",
                        style: TextStyle(
                          color:Colors.purple,
                        ),),
                        const SizedBox(width: 40,),
                        Row(
                          children: [
                            InkWell(
                              onTap: ()
                              {
                                setState(() {
                                  number--;
                                });
                              },
                                child: const Icon(Icons.remove)),
                            Container(
                              height: 30,
                              width: 30,
                              color: Colors.purple,
                              child:  Center(child: Text("$number",
                              style:const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),)),
                            ),
                            InkWell(
                              onTap: ()
                              {
                                setState(() {
                                  number++;
                                });
                              },
                              child: const Icon(Icons.add,
                              color: Colors.green,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
