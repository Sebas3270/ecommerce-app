import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode( bool value ){
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
      // titleLarge: const TextStyle(
      //   fontSize: 80,
      //   fontFamily: 'DeliriumNeon',
      //   color: Colors.black
      // ),
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

    scaffoldBackgroundColor: Colors.white,
    cardColor: const Color.fromARGB(255, 241, 241, 241)

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

    scaffoldBackgroundColor: Color.fromARGB(255, 24, 24, 24),
    cardColor: Color.fromARGB(255, 46, 46, 46)

  );

}