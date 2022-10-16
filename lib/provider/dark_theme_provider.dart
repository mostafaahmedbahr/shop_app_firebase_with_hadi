 import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_firebase_with_hadi/shared_pref/shared_ref.dart';
class DarkThemeProvider with ChangeNotifier
{
   bool _darkTheme = false ;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool val)
  {
    _darkTheme = val;
     notifyListeners();
  }




}