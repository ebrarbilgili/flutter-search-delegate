import 'package:flutter/material.dart';
import 'package:search_delegate_demo/search.dart';
import './user_view_view_model.dart';

class UserViewView extends UserViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return buildCard(index);
      },
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

  AppBar buildAppBar() {
    return AppBar(
      title: Text('User Search Demo'),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: UserSearch(allUsers: list, usersSuggestions: list),
            );
          },
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}
