import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/common/api.dart';

class ProductsService extends ChangeNotifier {

  ProductsService(){
    getInitialData();
  }

  List<Product> latestProducts = [];
  List<Product> cellphonesProducts = [];
  List<Product> videogamesProducts = [];

  late Product _selectedProduct;
  Product get selectedProduct => _selectedProduct;
  set selectedProduct( Product product ){
    _selectedProduct = product;
    notifyListeners();
  }

  List<Product> searchProducts = [];

  /// Search products for backend
  void searchProductsByTerm( String searchTerm ) async {
    List<Product> newProducts;
    if(searchTerm.isEmpty){
      newProducts = [];
    }else{
      // newProducts = productsBase.where((product) => product.name.startsWith(searchTerm)).toList();
      newProducts = await Api.getLatestProductsApi( searchTerm: searchTerm );
    }
    searchProducts = newProducts;
    notifyListeners();
  }

  void getInitialData() async {

    List<List<Product>> productsResults = await Future.wait([
      Api.getLatestProductsApi(),
      Api.getLatestProductsApi( tagTerm: "cellphones" ),
      Api.getLatestProductsApi( tagTerm: "videogames" ),
    ]);
    latestProducts = productsResults[0];
    cellphonesProducts = productsResults[1];
    videogamesProducts = productsResults[2];
    notifyListeners();
  }

}