import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    final productsLists = [
      // {
      //   'Latest Products': productsService.latestProducts,
      //   'Cellphones': productsService.cellphonesProducts,
      //   'Videogames': productsService.videogamesProducts,
      // },
      {
        'title': 'Latest Products',
        'source': productsService.latestProducts
      },
      {
        'title': 'Cellphones',
        'source': productsService.cellphonesProducts
      },
      {
        'title': 'Videogames',
        'source': productsService.videogamesProducts
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Products',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 40
                        ),
                      ),
                      Icon(
                        EvaIcons.bellOutline,
                        size: 30,
                      ),
                    ],
                  ),
                )
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 5, 87, 10),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Spring offers', 
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                            ),
                          ),
                          Text('Check the new Spring offers',
                            style: TextStyle(
                              color: Colors.white60
                            ),
                          ),
                        ],
                      ),

                      const Positioned(
                        bottom: -30,
                        right: -10,
                        child: Icon(
                          EvaIcons.shoppingBag,
                          size: 120,
                          color: Colors.white24,
                        )
                      )
                    ],
                  ),
                ),
              ),

              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 5),
                itemCount: productsLists.length,
                itemBuilder: (context, index) => ProductsHorizontalList(
                  title: productsLists[index]["title"] as String, 
                  products: productsLists[index]["source"]! as List<Product>
                ), 
                separatorBuilder: (context, index) => const SizedBox(height: 5,), 
              ),

            ],
          ),
        )
   );
  }
}