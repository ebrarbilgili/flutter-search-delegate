
https://user-images.githubusercontent.com/61385522/118816705-1ecbcd00-b8bb-11eb-81d0-79d9da8a1a12.mov


### HOW TO DO

We will create our atomic ListView:

```dart
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
```


and then we will create our Search Class with Search Delegate:

```dart
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
```
builActions and buildLeading are our Buttons because we may need to make delete our searching or navigate to back. buildResults and buildSuggestions are our Searching List when we searched something.

Let's call on appbar:
```dart
AppBar(
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
    )
```

Aaaanndd it is done!