/// Dart koleksiyonları için kütüphane
import 'dart:collection';
/// Flutter kitaplığı
import 'package:flutter/cupertino.dart';
/// Item sınıfı
import './item.dart';

/// Item verilerini yöneten sınıf
class ItemData with ChangeNotifier {
  /// Item listesi
  final List<Item> _items = [
    /// Örnek olarak eklenen öğeler
     Item(title: "7'de Kalk"),
    // Item(title: 'İşe Git Gel'),
    // Item(title: "19'de Bilgisayar'a Otur"),
    // Item(title: 'Kod Yazmaya Başla.'),
  ];

  /// Durumu değiştirme işlevi
  void toggleStatus(int index) {
    /// Seçilen öğenin durumunu değiştiriyoruz
    _items[index].toggleStatus();
    /// Dinleyicilere bildirim gönderiyoruz
    notifyListeners();
  }

  /// Öğe ekleme işlevi
  void addItem(String title) {
    /// Yeni bir öğe ekliyoruz
    _items.add(Item(title: title));
    /// Dinleyicilere bildirim gönderiyoruz
    notifyListeners();
  }

  /// Öğe silme işlevi
  void deleteItem(int index) {
    /// Seçilen öğeyi listeden kaldırıyoruz
    _items.removeAt(index);
    /// Dinleyicilere bildirim gönderiyoruz
    notifyListeners();
  }

  /// Öğeleri sadece okunabilir liste olarak döndürme işlevi
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
}
