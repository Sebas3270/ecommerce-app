import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductsHorizontalList extends StatelessWidget {

  String title;
  List<Product> products;

  ProductsHorizontalList({
    Key? key,
    required this.title,
    required this.products
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final length = products.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(title,
            style: const TextStyle(
                fontSize: 21.5,
                fontWeight: FontWeight.w600
            ),
          ),
        ),

        const SizedBox(height: 10,),

        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: length,
            itemBuilder: (context, index){

              if(index == 0){
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ProductCard(product: products[index]),
                );
              }

              if(index == length - 1){
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ProductCard(product: products[index]),
                );
              }
              
              return ProductCard(product: products[index]);


            },
          ),
        )
      ],
    );
  }
}