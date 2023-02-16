import 'dart:convert';
import 'package:ecommerce_app/models/models.dart';

class AuthResponse {
    AuthResponse({
        required this.token,
        required this.user,
    });

    String token;
    User user;

    factory AuthResponse.fromJson(String str) => AuthResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        token: json["token"],
        user: User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "user": user.toMap(),
    };
}