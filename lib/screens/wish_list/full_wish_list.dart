 import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class FullWishListScreen extends StatefulWidget {
  const FullWishListScreen({Key? key}) : super(key: key);

  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<FullWishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish List"),
      ),
      body: ListView.builder(
          itemCount:5,
          itemBuilder: (context,index)
      {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(right: 30.0, bottom: 10.0),
                child: Material(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  elevation: 3.0,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            height: 80,
                            child: Image.network(
                                'https://abong.com.bd/public//admin/media/2020/03/yellow_mesh_men_sport_sneaker_shoesjpeg_20200307141459.jpeg'),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'title',
                                  style: TextStyle(
                                      fontSize: 16.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  "\$ 16",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              positionedRemove(),
            ],
          ),
        );
      }),
    );
  }

  Widget positionedRemove() {
    return Positioned(
      top: 20,
      right: 15,
      child: SizedBox(
        height: 30,
        width: 30,
        child: MaterialButton(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          padding: EdgeInsets.all(0.0),
          color: ColorsConsts.favColor,
          child: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
