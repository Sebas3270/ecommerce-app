import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/common/api.dart';

class ProductsService extends ChangeNotifier {

  ProductsService(){
    getLatestProducts();
  }

  late Product _selectedProduct;
  Product get selectedProduct => _selectedProduct;
  set selectedProduct( Product product ){
    _selectedProduct = product;
    notifyListeners();
  }



  List<Product> _searchProducts = [];
  List<Product> get searchProductsList => _searchProducts;
  set searchProductsList( List<Product> products ){
    _searchProducts = products;
    notifyListeners();
  }

  List<Product> _latestProducts = [];
  List<Product> get latestProductsList => _latestProducts;
  set latestProductsList( List<Product> products ){
    _latestProducts = products;
    notifyListeners();
  }

  /// Search products for backend
  void searchProducts( String searchTerm ) async {
    List<Product> newProducts;
    if(searchTerm.isEmpty){
      newProducts = [];
    }else{
      // newProducts = productsBase.where((product) => product.name.startsWith(searchTerm)).toList();
      newProducts = await Api.getSearchProductsApi(searchTerm);
    }
    searchProductsList = newProducts;
  }

  void getLatestProducts() async {
    List<Product> newProducts;
    // newProducts = productsBase.sublist(productsBase.length - 5);
    newProducts = await Api.getLatestProductsApi();
    latestProductsList = newProducts;
  }

}