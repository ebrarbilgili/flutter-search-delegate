import 'package:flutter/material.dart';

import 'package:search_delegate_demo/user_model.dart';

class UserSearch extends SearchDelegate<UserModel> {
  final List<UserModel> allUsers;
  final List<UserModel> usersSuggestions;
  UserSearch({
    required this.allUsers,
    required this.usersSuggestions,
  });

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
        close(context, allUsers.first);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchList = allUsers
        .where(
          (element) => element.name!.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    Card buildCard(int index) {
      final user = searchList[index];
      return Card(
        child: ListTile(
          leading: Text(user.id.toString()),
          title: Text(user.name ?? 'user'),
        ),
      );
    }

    return ListView.builder(
      itemCount: searchList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildCard(index);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchList = usersSuggestions.where(
      (element) {
        if (!element.name!.toLowerCase().contains(query.toLowerCase())) {
          return element.id!.toString().contains(query.toLowerCase());
        } else {
          return element.name!.toLowerCase().contains(query.toLowerCase());
        }
      },
    ).toList();

    Card buildCard(int index) {
      final user = searchList[index];
      return Card(
        child: ListTile(
          leading: Text(user.id.toString()),
          title: Text(user.name ?? 'user'),
        ),
      );
    }

    return ListView.builder(
      itemCount: searchList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildCard(index);
      },
    );
  }
}
