import 'dart:convert';

main() {
  Item itemObject = Item(isDone: true, title: 'Uyu');
  print('itemObject: $itemObject');
  print('itemObject Type: ${itemObject.runtimeType}');

  Map itemAsMap = itemObject.toMap();
  print('itemAsMap: $itemAsMap');
  print('itemAsMap Type: ${itemAsMap.runtimeType}');

  String itemAsJson = json.encode(itemAsMap);
  print('itemAsJson: $itemAsJson');
  print('itemAsJson Type: ${itemAsJson.runtimeType}');

  itemAsMap = json.decode(itemAsJson);
  //itemObject = Item(isDone: itemAsMap['isDone'], title: itemAsMap['title']);
  itemObject = Item.fromMap(itemAsMap as Map<String, dynamic>);
  print(itemObject);
}

class Item {
  String? title;
  bool isDone;

  Item({required this.isDone, required this.title});

  Item.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        isDone = map['isDone'];
  Map<String, dynamic> toMap() => {
        'title': title,
        'isDone': isDone,
      };
}
