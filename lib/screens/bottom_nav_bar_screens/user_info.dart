import 'package:flutter/material.dart';
 import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_firebase_with_hadi/provider/dark_theme_provider.dart';

import '../part_of_screens/user_info_parts/user_bag_widget_screen.dart';
import '../part_of_screens/user_info_parts/user_info.dart';
import '../part_of_screens/user_info_parts/user_settings_widget_screen.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  // Just add late modifier here, late modifier means that this variable must
  // be initilized later on, and we are initializing it in the init state..
  // You also forget to initialize it in the init state
  // late modifier can be used while declaring a non-nullable
  // variable that’s initialized after its declaration.
  //For more read https://dev.to/pktintali/late-variables-in-dart-dart-learning-series-1-2opf
  late ScrollController _scrollController;
  var top = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                // leading: Icon(Icons.ac_unit_outlined),
                // automaticallyImplyLeading: false,
                elevation: 0,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;

                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.deepPurple,
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      // collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: top <= 110.0 ? 1.0 : 0,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            Container(
                              height: kToolbarHeight / 1.8,
                              width: kToolbarHeight / 1.8,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 1.0,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text(
                              'Guest',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      background: const Image(
                        image: NetworkImage(
                            'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:     [
                    const UserBagWidgetScreen(),
                    const UserInfoWidgetScreen(),
                    UserSettingsWidgetScreen(),
                  ],
                ),
              )
            ],
          ),
          _buildFab()
        ],
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    const double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    const double scaleStart = 160.0;
    //pixels from top where scaling should end
    const double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down

        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down

        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          heroTag: "btn1",
          onPressed: () {},
          child: const Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }


 }
