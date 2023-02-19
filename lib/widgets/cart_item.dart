import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {

  Item cartItem;
  double size = 90;
  int position;

  CartItem({
    Key? key,
    required this.cartItem,
    required this.position
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cartService = Provider.of<CartService>(context, listen: false);

    return Dismissible(
      key: Key(cartItem.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        await cartService.deleteItem(cartItem);
      },
      background: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFE6E6)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(EvaIcons.trashOutline),
            SizedBox(width: 20,)
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(cartItem.product.image),
              ),
            ),
    
            SizedBox(width: 14,),
    
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItem.product.name,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis
                    ),
                  ),
                  Text('\$${cartItem.product.price * cartItem.quantity}',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  
                ],
              ),
            ),
    
            _QuantityRow(cartItem: cartItem, position: position,)
          ],
        ),
      ),
    );
  }
}

class _QuantityRow extends StatelessWidget {
  const _QuantityRow({
    Key? key,
    required this.cartItem,
    required this.position,
  }) : super(key: key);

  final Item cartItem;
  final int position;

  @override
  Widget build(BuildContext context) {

    final cartService = Provider.of<CartService>(context, listen: false);

    return Row(
      children: [
        GestureDetector(
          onTap: cartService.cartLoading ? null : () async {
            await cartService.reduceQuantity(position);
          },
          child: CircleAvatar(
            radius: 12,
            child: Icon(Icons.remove, size: 15,),
          ),
        ),
        SizedBox(width: 15,),
        Text(cartItem.quantity.toString(),
          style: TextStyle(
            fontSize: 18
          ),
        ),
        SizedBox(width: 15,),
        GestureDetector(
          onTap: cartService.cartLoading ? null : () async {
            await cartService.addQuantity(position);
          },
          child: CircleAvatar(
            radius: 12,
            child: Icon(Icons.add, size: 15,),
          ),
        ),
      ],
    );
  }
}