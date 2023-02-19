import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final screenService = Provider.of<ScreenService>(context, listen: false);
    final cartService = Provider.of<CartService>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.all(Radius.circular(7))
                      ),
                      child: const Icon(
                        EvaIcons.arrowIosBackOutline
                      ),
                    ),
                  ),
                )
              ),
      
              Container(
                child: Image.network(productsService.selectedProduct.image),
              ),
      
              Text(
                productsService.selectedProduct.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 30,
                ),
              ),
      
              const SizedBox(height: 15,),
      
              Text(
                productsService.selectedProduct.description,
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  
                  await cartService.checkAdd(Item(id: 0, cartId: cartService.cart.id, productId: productsService.selectedProduct.id, quantity: 1, product: productsService.selectedProduct));
                  screenService.currentScreen = 2;
                  Navigator.of(context).pushNamedAndRemoveUntil("main", (route) => false,);
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  minimumSize: const Size(150, 40), //////// HERE
                ),
                child: Text(
                  cartService.cartLoading ? 'Loading...' : 'Add to cart',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ),

              Text(
                "\$${productsService.selectedProduct.price}",
                style:const  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
              )

            ],
          ),
        ),
      ),
   );
  }
}