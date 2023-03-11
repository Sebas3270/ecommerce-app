import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SearchScreen extends StatefulWidget {

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
                child: Text(
                  'Search',
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        
                        cursorColor: Colors.orange,
                        controller: searchTextController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Theme.of(context).cardColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onPressed: () {
                          productsService.searchProductsByTerm(searchTextController.text.trim());
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        icon: const Icon(EvaIcons.searchOutline, color: Colors.white,)
                      ),
                    )
                  ],
                ),
              ),
            ),

            Expanded(
              child: searchTextController.text.isEmpty 
              ? const _EmptySearchWidget()
              : productsService.searchProducts.isNotEmpty
                ? _SearchResultsList(products: productsService.searchProducts)
                : const _NotFoundItems()
            ),
        ],
      )
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
              Icons.videogame_asset_outlined,
              size: 180,
              color: Colors.black12,
            ),
            Text(
              'Look for something',
              style: TextStyle(
                color: Colors.black26, 
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
            ),
            Spacer(flex: 2,)
          ],
        ),
      );
  }
}

class _NotFoundItems extends StatelessWidget {
  const _NotFoundItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: const [
            Spacer(),
            Icon(
              Icons.find_in_page_outlined,
              size: 180,
              color: Colors.black12,
            ),
            Text(
              'There are no results\nfor your search',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black26, 
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
            ),
            Spacer(flex: 2,)
          ],
        ),
      );
  }
}

class _SearchResultsList extends StatelessWidget {
  const _SearchResultsList({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext ctx, index) {
        return ProductCard(product: products[index], fillWidth: true,);
      }
    );
  }
}