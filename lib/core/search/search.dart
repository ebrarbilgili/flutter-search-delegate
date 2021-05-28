import 'package:flutter/material.dart';
import 'package:search_delegate_demo/core/widget/listview.dart';

import 'package:search_delegate_demo/user_model.dart';

class UserSearch extends SearchDelegate<UserModel> {
  final List<UserModel> users;
  UserSearch({required this.users});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, users.first);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListViewWidget(list: searchList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListViewWidget(list: searchList);
  }

  List<UserModel> get searchList {
    return users
        .where(
          (element) =>
              element.name!.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
