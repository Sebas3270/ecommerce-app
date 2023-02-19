import 'package:ecommerce_app/services/services.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatelessWidget {
  
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final cartService = Provider.of<CartService>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0, right: 20, left: 20),
                child: Text(
                  'Cart',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),

            Expanded(
              child: cartService.cart.items.isEmpty
              ? const _EmptySearchWidget()
              : _CartList(cartService: cartService)
            )
        ],
      ),
   );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({
    Key? key,
    required this.cartService,
  }) : super(key: key);

  final CartService cartService;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 25),
      itemCount: cartService.cart.items.length,
      itemBuilder: (context, index) => CartItem( 
        cartItem: cartService.cart.items[index],
        position: index,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20,),
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