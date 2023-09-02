/// Dart koleksiyonları için kütüphane
import 'dart:collection';
import 'dart:convert';

/// Flutter kitaplığı
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Item sınıfı
import './item.dart';

/// Item verilerini yöneten sınıf
class ItemData with ChangeNotifier {
  /// Item listesi
  final List<Item> _items = [
    /// Örnek olarak eklenen öğeler
    // Item(title: "7'de Kalk"),
    // Item(title: 'İşe Git Gel'),
    // Item(title: "19'de Bilgisayar'a Otur"),
    // Item(title: 'Kod Yazmaya Başla.'),
  ];

  bool _isGreen = true;
  static SharedPreferences? _sharedPref;
  List<String> _itemsAsString = [];

  /// Durumu değiştirme işlevi
  void toggleStatus(int index) {
    /// Seçilen öğenin durumunu değiştiriyoruz
    _items[index].toggleStatus();

    /// Dinleyicilere bildirim gönderiyoruz

    saveItemsToSharePref(items);
    notifyListeners();
  }

  /// Öğe ekleme işlevi
  void addItem(String title) {
    /// Yeni bir öğe ekliyoruz
    _items.add(Item(title: title));

    /// Dinleyicilere bildirim gönderiyoruz

    saveItemsToSharePref(items);
    notifyListeners();
  }

  /// Öğe silme işlevi
  void deleteItem(int index) {
    /// Seçilen öğeyi listeden kaldırıyoruz
    _items.removeAt(index);

    /// Dinleyicilere bildirim gönderiyoruz

    saveItemsToSharePref(items);
    notifyListeners();
  }

  /// Öğeleri sadece okunabilir liste olarak döndürme işlevi
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  ///Shared Pref metotları

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveItemsToSharePref(List<Item> items) {
    _itemsAsString.clear();

    for (var item in items) {
      _itemsAsString.add(jsonEncode(item.toMap()));
    }

    _sharedPref?.setStringList('toDoData', _itemsAsString);
  }

  void loadItemsFromSharedPref() {
    List<String>? tempList =  _sharedPref?.getStringList('toDoData') ?? [];
    _items.clear();
    for (var item in tempList) {
      _items.add(Item.fromMap(    jsonDecode(item)    ));



    }

  }

}
