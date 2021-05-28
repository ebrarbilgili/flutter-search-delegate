import 'package:flutter/material.dart';

import 'package:search_delegate_demo/user_model.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key, required this.list}) : super(key: key);

  final List<UserModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) => buildCard(index),
    );
  }

  Card buildCard(int index) {
    final user = list[index];
    return Card(
      child: ListTile(
        leading: Text(user.id.toString()),
        title: Text(user.name ?? 'user'),
      ),
    );
  }
}
