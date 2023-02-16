import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';


class CartScreen extends StatelessWidget {
  
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
                child: Text(
                  'Cart',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),

            const Expanded(child: _EmptySearchWidget())
        ],
      ),
   );
  }
}

class _EmptySearchWidget extends StatelessWidget {
  const _EmptySearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: const [
            Spacer(),
            Icon(
              EvaIcons.shoppingBagOutline,
              size: 180,
              color: Colors.black12,
            ),
            Text(
              'There are no products\nin your cart',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black26, 
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(flex: 2,)
          ],
        ),
      );
  }
}