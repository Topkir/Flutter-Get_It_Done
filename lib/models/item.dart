import 'dart:convert';

/// Öğe sınıfı
class Item {
  /// Öğe başlığı
  final String title;

  /// Öğenin tamamlanma durumu
  bool isDone;

  /// Constructor
  /// true ise false / false ise true ya çevirir. (=!)
  Item({required this.title, this.isDone = false});

  /// Durum değiştirme işlevi
  void toggleStatus() {
    /// Öğenin tamamlanma durumunu tersine çeviriyoruz
    isDone = !isDone;
  }

  Item.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        isDone = map['isDone'];
  Map<String, dynamic> toMap() => {
        'title': title,
        'isDone': isDone,
      };


}
