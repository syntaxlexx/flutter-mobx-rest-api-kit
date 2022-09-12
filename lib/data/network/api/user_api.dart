import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../models/user.dart';

class UserApi {
  Future<List<User>> getUsers() async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://reqres.in/api/users?page=1',
        ),
      );
      final data = (jsonDecode(res.body) as List)
          .map((user) => User.fromMap(user as Map<String, dynamic>))
          .toList();
      return data;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
