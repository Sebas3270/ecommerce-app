import 'package:ecommerce_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder( 
        future: checkLogInState(context),
        builder: (context, snapshot) => const Center(
          child: CircularProgressIndicator(
            color: Colors.orange,
          )
        ),
      ),
   );
  }

  Future checkLogInState(BuildContext context) async {
    
    final authService = Provider.of<AuthService>(context, listen: false);
    // final socketService= Provider.of<SocketService>(context, listen: false);
    final authenticated = await authService.isLogged();

    if(authenticated){
      // await getStoredTheme(context);
      // socketService.connect();
      final cartService = Provider.of<CartService>(context, listen: false);
      await cartService.getCart();
      Navigator.pushReplacementNamed(context, 'main');
    }else{
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

}