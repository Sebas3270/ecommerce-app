import 'dart:convert';

import 'package:ecommerce_app/common/environment.dart';
import 'package:ecommerce_app/models/auth_response.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  
  late User user;
  bool _authenticating = false;
  final _storage = const FlutterSecureStorage();

  bool get authenticating => _authenticating;
  set authenticating(bool value){
    _authenticating = value;
    notifyListeners();
  }

  bool _isAuthLoading = false;
  bool get isAuthLoading => _isAuthLoading;
  set isAuthLoading(bool value){
    _isAuthLoading = value;
    notifyListeners();
  }

  static Future<String> getToken()async{
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token ?? '';
  }
  
  Future _storeToken( String token ) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logOut() async {
    await _storage.delete(key: 'token');
  }

  Future<bool> isLogged() async {
    final token = await _storage.read(key: 'token');

    final resp = await http.post(
      Uri.parse('${Environment.apiUrl}/auth/renew'), 
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if(resp.statusCode == 200){
      final loginResponse = AuthResponse.fromJson(resp.body);
      user = loginResponse.user;
      await _storeToken(loginResponse.token);
      return true;
    }else{
      logOut();
      return false;
    }
  }

  Future<bool> login( String email, String password ) async {

    isAuthLoading = true;

    final data = {
      'email': email,
      'password': password,
    };

    final resp = await http.post(
      Uri.parse('${Environment.apiUrl}/auth/login'), 
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    _authenticating = false;
    print(resp.body);

    if(resp.statusCode == 200){
      final loginResponse = AuthResponse.fromJson(resp.body);
      user = loginResponse.user;
      await _storeToken(loginResponse.token);
      return true;
    }else{
      return false;
    }

  }

}