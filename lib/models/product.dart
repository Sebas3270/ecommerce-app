import 'dart:convert';

class Product {

  String id;
  String name;
  double price;
  String image;
  String description;
  List<String>? tags;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.tags,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
      id: json["id"],
      name: json["name"],
      price: json["price"] is int ? (json["price"] as int).toDouble() : (json["price"] as double) ,
      image: json["image"],
      description: json["description"] ?? '',
      tags: (json["tags"] is List<dynamic>) ? List<String>.from(json["tags"].map((x) => x)) : null,
    );
    

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "description": description,
        "tags": (tags == null) ? [] : List<String>.from(tags!.map((x) => x)),
    };

}