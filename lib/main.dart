import 'package:flutter/material.dart';
import 'package:search_delegate_demo/user_view/user_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: UserView(),
    );
  }
}
