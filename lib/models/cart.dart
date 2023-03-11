// To parse this JSON data, do
//
//     final cart = cartFromMap(jsonString);

import 'dart:convert';

import 'package:ecommerce_app/models/models.dart';

class Cart {
    Cart({
        required this.userId,
        required this.total,
        required this.items,
    });

    int userId;
    double total;
    List<Item> items;

    factory Cart.fromJson(String str) => Cart.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        userId: json["userId"],
        total: json["total"]?.toDouble(),
        items: json["items"] != null ? List<Item>.from(json["items"].map((x) => Item.fromMap(x))) : [],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "total": total,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
    };
}

class Item {
    Item({
        required this.id,
        required this.userId,
        required this.productId,
        required this.quantity,
        required this.product,
    });

    String id;
    int userId;
    String productId;
    int quantity;
    Product product;

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        userId: json["userId"],
        productId: json["productId"],
        quantity: json["quantity"],
        product: Product.fromMap(json["product"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "productId": productId,
        "quantity": quantity,
        "product": product.toMap(),
    };
}