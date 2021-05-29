import 'package:flutter/material.dart';

import '../core/search/search.dart';
import '../core/widget/listview.dart';
import 'user_view_view_model.dart';

class UserViewView extends UserViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListViewWidget(list: list),
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
              delegate: UserSearch(users: list),
            );
          },
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}
