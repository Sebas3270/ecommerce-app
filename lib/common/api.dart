import 'dart:convert';

import 'package:ecommerce_app/common/environment.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:http/http.dart' as http;

class Api {

  static Future<List<Product>> getLatestProductsApi() async{

    final resp = await http.get(
      Uri.parse('${Environment.apiUrl}/products?limit=5'), 
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      
    );

    if(resp.statusCode == 200){

      final productsDecoded = jsonDecode(resp.body);

      if(productsDecoded == null){
        return [];
      }

      final products = (productsDecoded as List)
            .map((value) => Product.fromMap(value))
            .toList();

      return products;

    }else{
      return [];
    }

  }

  static Future<List<Product>> getSearchProductsApi( String searchTerm ) async{

    final resp = await http.get(
      Uri.parse('${Environment.apiUrl}/products?begin=$searchTerm'), 
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      
    );

    if(resp.statusCode == 200){

      final productsDecoded = jsonDecode(resp.body);

      if(productsDecoded == null){
        return [];
      }

      final products = (productsDecoded as List)
            .map((value) => Product.fromMap(value))
            .toList();

      return products;

    }else{
      return [];
    }

  }

}