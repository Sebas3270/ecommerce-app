import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {

  AppTheme(){
    getPreferences();
  }

  static late SharedPreferences prefs;
  static late String mode;

  static setPrefs(SharedPreferences sp){
    mode = sp.getString('mode') ?? 'light';
    prefs = sp;
  }

  getPreferences() async {
    isDarkMode = mode == 'dark';
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode( bool value ){
    if(value){
      prefs.setString('mode', 'dark');
    }else{
      prefs.setString('mode', 'light');
    }
    _isDarkMode = value;
    notifyListeners();
  }

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  final ThemeData _lightTheme = ThemeData.light().copyWith(

    textTheme: ThemeData.light().textTheme
    .apply(
      fontFamily: 'Poppins',
    )
    .copyWith(
      titleLarge: const TextStyle(
        fontSize: 40,
        fontFamily: 'Poppins',
        color: Colors.black,
        fontWeight: FontWeight.w700
      ),
      labelMedium: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
        color: Colors.black,
        fontFamily: 'Poppins',
        height: 1.1
      ),
      labelSmall: const TextStyle(
        color: Colors.black54,
        fontSize: 14,
        fontFamily: 'Poppins',

      ),
    ),

    colorScheme: ThemeData.light().colorScheme.copyWith(
      primary: Colors.orange[600],
    ),

    primaryColor: Colors.orange[600],
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: ThemeData.light().bottomNavigationBarTheme.copyWith(
      backgroundColor: Colors.white,
      elevation: 0
    ),
    cardColor: const Color.fromARGB(255, 241, 241, 241),
    hoverColor: Color(0xFFFFE6E6),
    dividerColor: Colors.black12,
    secondaryHeaderColor: Colors.black38,

  );

  final ThemeData _darkTheme = ThemeData.dark().copyWith(

    textTheme: ThemeData.dark().textTheme
    .apply(
      fontFamily: 'Poppins',
    )
    .copyWith(
      titleLarge: const TextStyle(
        fontSize: 40,
        fontFamily: 'Poppins',
        color: Colors.white,
        fontWeight: FontWeight.w700
      ),
      labelMedium: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
        color: Colors.white,
        fontFamily: 'Poppins',
        height: 1.1
      ),
      labelSmall: const TextStyle(
        color: Colors.white54,
        fontSize: 14,
        fontFamily: 'Poppins',

      ),
    ),

    colorScheme: ThemeData.dark().colorScheme.copyWith(
      primary: Colors.orange[600],
    ),

    primaryColor: Colors.orange[600],
    scaffoldBackgroundColor: Color.fromARGB(255, 24, 24, 24),
    bottomNavigationBarTheme: ThemeData.dark().bottomNavigationBarTheme.copyWith(
      backgroundColor: Color.fromARGB(255, 24, 24, 24),
      elevation: 0
    ),
    cardColor: Color.fromARGB(255, 46, 46, 46),
    hoverColor: Color.fromARGB(255, 122, 5, 5),
    dividerColor: Colors.white12,
    secondaryHeaderColor: Colors.white30,

  );

}