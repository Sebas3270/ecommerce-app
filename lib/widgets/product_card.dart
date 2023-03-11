import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {

  Product product;
  bool fillWidth;

  ProductCard({
    Key? key,
    required this.product,
    this.fillWidth = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        final productsService = Provider.of<ProductsService>(context, listen: false);
        productsService.selectedProduct = product;
        Navigator.of(context).pushNamed('product');
      },
      child: Container(
        // width: !fillWidth ? 150 : double.infinity,
        width: 150 ,
        margin: !fillWidth ? const EdgeInsets.only(right: 13) : EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    
            const SizedBox(height: 10,),
    
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  
                ),
              ),
            ),
    
            const SizedBox(height: 10,),
    
            Padding(
              padding: const EdgeInsets.only(left: 7.0, right: 7, top: 5),
              child: Text(product.name,
              maxLines: 2,
                style: Theme.of(context).textTheme.labelMedium
              ),
            ),
    
            Padding(
              padding: const EdgeInsets.only(left: 7.0, bottom: 5),
              child: Text('\$${product.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.labelSmall
              ),
            ),
    
          ],
        ),
      ),
    );
  }
}