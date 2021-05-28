import 'dart:io';

import 'package:dio/dio.dart';
import 'package:search_delegate_demo/user_model.dart';

class UserService {
  final Dio service;
  UserService({required this.service});

  Future<List<UserModel>> fetchUsers() async {
    final response = await service.get('/users');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => UserModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
