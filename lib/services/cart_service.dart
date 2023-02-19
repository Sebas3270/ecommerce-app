import 'package:ecommerce_app/common/api.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:flutter/material.dart';

class CartService extends ChangeNotifier {

  late Cart _cart;
  Cart get cart => _cart;
  set cart( Cart cart ){
    _cart = cart;
    notifyListeners();
  }

  bool _cartLoading = false;
  bool get cartLoading => _cartLoading;
  set cartLoading( bool value ){
    _cartLoading = value;
    notifyListeners();
  }

  Future<void> getCart() async{

    final token = await AuthService.getToken();
    final checkCart = await Api.getCart(token);

    if (checkCart != null) {
      cart = checkCart;
    }

  }

  Future<void> deleteItem( Item item ) async{
    cartLoading = true;
    cart.items.remove(item);
    notifyListeners();
    final token = await AuthService.getToken();
    final success = await Api.deleteItemFromCart(token, item);
    cartLoading = false;
  }

  Future checkAdd( Item item )async{
    int pos = cart.items.indexWhere((element) => element.productId == item.productId);
    if(pos == -1){
      await addItem(item);
    }else{
      await addQuantity(pos);
    }
  }

  Future addItem( Item item )async{
    cartLoading = true;
    // cart.items.add(item);
    // notifyListeners();
    final token = await AuthService.getToken();
    Item? newItem = await Api.addItemToCart(token, item);
    if(newItem != null){
      item.id = newItem.id;
      cart.items.add(item);
      notifyListeners();
    }
    cartLoading = false;
  }

  Future addQuantity( int pos )async{
    
    // Item item = cart.items[pos];
    // item.quantity++;
    // cart.items[pos] = item;
    cartLoading = true;
    Item item = cart.items[pos];
    final token = await AuthService.getToken();
    bool success = await Api.addQuantityItem(token, item);
    if(success){
      item.quantity++;
      cart.items[pos] = item;
      notifyListeners();
    }
    cartLoading = false;
  }

  Future reduceQuantity( int pos )async{
    // Item item = cart.items[pos];
    // item.quantity--;
    // cart.items[pos] = item;

    cartLoading = true;
    Item item = cart.items[pos];
    final token = await AuthService.getToken();
    bool success = await Api.reduceQuantityItem(token, item);
    if(success){
      item.quantity--;
      cart.items[pos] = item;
      notifyListeners();
    }
    cartLoading = false;
  }

}