import 'package:flutter/material.dart';

class ScreenService extends ChangeNotifier {

  int _currentScreen = 0;

  int get currentScreen => _currentScreen;
  
  set currentScreen( int value ){
    _currentScreen = value;
    notifyListeners();
  }


}