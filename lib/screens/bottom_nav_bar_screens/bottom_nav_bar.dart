
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttericon/typicons_icons.dart';

import 'package:shop_app_firebase_with_hadi/screens/bottom_nav_bar_screens/feeds.dart';
import 'package:shop_app_firebase_with_hadi/screens/bottom_nav_bar_screens/search.dart';
import 'package:shop_app_firebase_with_hadi/screens/bottom_nav_bar_screens/user_info.dart';

  import 'cart/cart_screen.dart';
import 'home/home.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  // List pages = [
  //   const HomeScreen(),
  //   const  FeedsScreen(),
  //   const  SearchScreen(),
  //   const CartScreen(),
  //   const UserInfoScreen(),
  // ];

  // List<Map<String, Object>>? _pages;
  var pages = [];
  int _selectedPageIndex = 4;

  @override
  void initState() {
    pages = [
      {
        'page': const HomeScreen(),
        "title": "HomeScreen",
      },
      {
        'page':   FeedsScreen(appBarTitle: '',

        ),
        "title": "FeedsScreen",
      },
      {
        'page': const SearchScreen(),
        "title": "SearchScreen",
      },
      {
        'page': const CartScreen(),
        "title": "CartScreen",
      },
      {
        'page': UserInfoScreen(),
        "title": "UserInfoScreen",
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(pages[_selectedPageIndex]["title"]),
      // ),
      body: pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.purple,
              currentIndex: _selectedPageIndex,
              items:    const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  tooltip:  'Home',
                  label:  'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.rss_feed),
                  tooltip:  'Feeds',
                  label:  'Feeds',
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  tooltip: 'Search',
                  label:  'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.cart_badge_plus,
                  ),
                  tooltip: 'Cart',
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Typicons.user),
                  tooltip:  'User',
                  label:  'User',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          elevation: 4,
          child: const Icon(Icons.search),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
