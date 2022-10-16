 import 'package:backdrop/backdrop.dart';

import 'package:flutter/material.dart';

import 'back_home_layer.dart';
import 'front_home_layer.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          headerHeight: MediaQuery.of(context).size.height*0.25,
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: BackdropAppBar(
            leading: const BackdropToggleButton(
              icon: AnimatedIcons.home_menu,
              color: Colors.black,
            ),
            title: const Text("Home",
            style: TextStyle(
              color: Colors.black,
            ),),
            actions: [
              IconButton(

                iconSize: 15,
                  onPressed: (){},
                  icon: const CircleAvatar(
                    radius: 19,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                        radius: 17,
                      backgroundImage: NetworkImage(
                          'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                  ),
                  ),
              ),
            ],
          ),
          backLayer: BackHomeLayer(),
          frontLayer: FrontHomeLayer(),
        ),
      ),
    );
  }
}
