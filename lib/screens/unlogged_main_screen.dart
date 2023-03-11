import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';


class UnloggedMainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final PageController controller = PageController();

    return Scaffold(
      body: PageView(
        controller: controller,        
        scrollDirection: Axis.horizontal,
        allowImplicitScrolling: false,
        
        physics: const BouncingScrollPhysics(),
        children: [
          LogInScreen(),
          RegisterScreen()
        ],
      )
   );
  }
}