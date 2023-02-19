import 'dart:convert';

class Product {

  String id;
  String name;
  double price;
  String image;
  String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json){

      double price;

      if(json["price"] is int){
        price = (json["price"] as int).toDouble();
      }else{
        price = (json["price"] as double);
      }

      return Product(
        id: json["id"],
        name: json["name"],
        price: price,
        image: json["image"],
        description: json["description"] ?? '',
      );
    }
    
    

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "description": description,
    };

}