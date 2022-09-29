import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAyTyfXPF0L-TV1f7FybLueuSn207i5hyQ';
  Future<void> signup(String email, String password) async {
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode(
        {'email': email, 'password': password, 'returnSecureToken': false},
      ),
    );
    print(jsonDecode(response.body));
  }
}
