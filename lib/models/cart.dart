// To parse this JSON data, do
//
//     final cart = cartFromMap(jsonString);

import 'dart:convert';

import 'package:ecommerce_app/models/models.dart';

class Cart {
    Cart({
        required this.total,
        required this.items,
    });

    double total;
    List<CartItem> items;

    factory Cart.fromJson(String str) => Cart.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        total: json["total"]?.toDouble(),
        items: List<CartItem>.from(json["items"].map((x) => CartItem.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
    };
}

class CartItem {
    CartItem({
        required this.quantity,
        required this.product,
    });

    int quantity;
    Product product;

    factory CartItem.fromJson(String str) => CartItem.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
        quantity: json["quantity"],
        product: Product.fromMap(json["product"]),
    );

    Map<String, dynamic> toMap() => {
        "quantity": quantity,
        "product": product.toMap(),
    };
}