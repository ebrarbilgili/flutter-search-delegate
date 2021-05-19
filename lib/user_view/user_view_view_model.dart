import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:search_delegate_demo/service.dart';
import 'package:search_delegate_demo/user_model.dart';
import './user_view.dart';

abstract class UserViewViewModel extends State<UserView> {
  late final UserService service;
  @override
  void initState() {
    super.initState();

    service = UserService(
      service: Dio(
        BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
      ),
    );

    fetchAllUsers();
  }

  List<UserModel> list = [];

  Future fetchAllUsers() async {
    list = await service.fetchUsers();
    setState(() {});
  }
}
