import 'package:ecommerce_app/screens/screens.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final screenService = Provider.of<ScreenService>(context);

    return Scaffold(
      body: IndexedStack(
        index: screenService.currentScreen,
        children: [
          HomeScreen(),
          SearchScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.orange[800],
        type: BottomNavigationBarType.fixed,
        currentIndex: screenService.currentScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.homeOutline),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.searchOutline),
            label: 'Products'
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.shoppingCartOutline),
            label: 'Cart'
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.personOutline),
            label: 'Account'
          ),
        ],
        onTap: (value) => screenService.currentScreen = value,
      ),
   );
  }
}