import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../models/auth.dart';

class AuthApi {
  var logger = Logger();

  Future<Auth> login(username, password) async {
    try {
      final res = await http.post(
          Uri.parse(
            'https://reqres.in/api/login',
          ),
          body: {
            username: username,
            password: password,
          });

      final data = jsonDecode(res.body);
      logger.d(data);
      final auth = Auth.fromMap(data as Map<String, dynamic>);
      return auth;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
