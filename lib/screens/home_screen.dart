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

    // final List<Product> products = [
    //   Product(id: '1', name: 'PS4 Console', price: 5999.99, image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/PS4-Console-wDS4.png/2560px-PS4-Console-wDS4.png'),
    //   Product(id: '3', name: 'Xiaomi Mi 10 256gb', price: 9999.99, image: 'https://storage.comprasmartphone.com/smartphones/xiaomi-mi-10-pro.png'),
    //   Product(id: '2', name: 'Samsung Galaxy S21', price: 15999.99, image: 'https://images.samsung.com/is/image/samsung/p6pim/es/sm-g990blgfeub/gallery/es-galaxy-s21-fe-g990-408720-sm-g990blgfeub-533298851'),
    // ];

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

              ProductsHorizontalList(
                title: 'Latest Products',
                products: productsService.latestProductsList,
              ),

              const SizedBox(height: 20,),

              // ProductsHorizontalList(
              //   title: 'Offers',
              //   products: products,
              // ),
              
              // const SizedBox(height: 60,),
        
            ],
          ),
        )
   );
  }
}