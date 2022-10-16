import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_firebase_with_hadi/provider/cart_provider.dart';
import 'package:shop_app_firebase_with_hadi/provider/dark_theme_provider.dart';
import 'package:shop_app_firebase_with_hadi/provider/product_provider.dart';
import 'package:shop_app_firebase_with_hadi/screens/bottom_nav_bar_screens/bottom_nav_bar.dart';
import 'package:shop_app_firebase_with_hadi/shared_pref/shared_ref.dart';

import 'consts/dark_theme.dart';

void main() {
    runApp(  MyApp());
}

class MyApp extends StatelessWidget {
    MyApp({Key? key}) : super(key: key);

  var darkThemeMode = DarkThemeProvider();
    var productProvider = ProductsProvider();
    var cartProvider = CartProvider();
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=>darkThemeMode,),
        ChangeNotifierProvider(
          create: (context)=>productProvider,),
        ChangeNotifierProvider(
          create: (context)=>cartProvider,),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context,themeData,child)
        {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(darkThemeMode.darkTheme,context),
            home: const BottomBarScreen(),
          );
        },

      ),
    );
  }
}


