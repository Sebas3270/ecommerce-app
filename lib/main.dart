import 'package:ecommerce_app/screens/screens.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppProvider());

class AppProvider extends StatelessWidget {

  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppTheme()),
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => ScreenService()),
        ChangeNotifierProvider(create: (context) => ProductsService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final themeService = Provider.of<AppTheme>(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith( 
        statusBarIconBrightness: themeService.isDarkMode ? Brightness.dark : Brightness.light,/* set Status bar icons color in Android devices.*/
        statusBarBrightness: themeService.isDarkMode ? Brightness.dark : Brightness.light)/* set Status bar icon color in iOS. */
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'loading',
      routes: {
        'loading': (context) => LoadingScreen(),
        'main': (context) => MainScreen(),
        'product': (context) => ProductScreen(),
        'login':(context) => LogInScreen(),
      },
      theme: themeService.isDarkMode ? themeService.darkTheme : themeService.lightTheme,
    );
  }
}