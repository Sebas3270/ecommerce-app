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

  static Future<Cart?> getCart( String token ) async {

    final resp = await http.get(
      Uri.parse('${Environment.apiUrl}/carts'), 
      headers: {
        'Content-Type': 'application/json',
        // 'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if(resp.statusCode == 200){
      Cart cart = Cart.fromJson(resp.body);
      print(cart);
      return cart;
    }else{
      return null;
    }

  }

  static Future<Item?> addItemToCart( String token, Item item ) async {

    final resp = await http.post(
      Uri.parse('${Environment.apiUrl}/carts'), 
      headers: {
        'Content-Type': 'application/json',
        // 'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({
        "productId": item.productId,
        "quantity": item.quantity
      })
    );

    if(resp.statusCode == 200){
      Item item = Item.fromJson(resp.body);
      return item;
    }else{
      return null;
    }

  }

  static Future<bool> addQuantityItem( String token, Item item ) async {

    final resp = await http.put(
      Uri.parse('${Environment.apiUrl}/carts?action=add'), 
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({
        "id": item.id
      })
    );

    if(resp.statusCode == 200){
      return true;
    }else{
      return false;
    }

  }

  static Future<bool> reduceQuantityItem( String token, Item item ) async {

    final resp = await http.put(
      Uri.parse('${Environment.apiUrl}/carts?action=reduce'), 
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({
        "id": item.id
      })
    );

    if(resp.statusCode == 200){
      return true;
    }else{
      return false;
    }

  }

  static Future<bool> deleteItemFromCart( String token, Item item ) async {

    final resp = await http.delete(
      Uri.parse('${Environment.apiUrl}/carts'), 
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({
        "id": item.id
      })
    );

    if(resp.statusCode == 200){
      return true;
    }else{
      return false;
    }

  }

}