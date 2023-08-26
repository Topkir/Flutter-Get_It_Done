import 'package:flutter/material.dart';

/// Öğe kartı bileşeni
class ItemCard extends StatelessWidget {
  /// Öğe başlığı
  final String title;
  /// Öğenin tamamlanma durumu
  final bool isDone;
  /// Durum değiştirme işlevi
  final Function(bool?) toggleStatus;
  /// Öğe silme işlevi
  final Function() deleteItem;


  /// Constructor
  /// Öğe kartı bileşeni constructor'ı
  ItemCard({
    /// Öğe başlığı (zorunlu)
    required this.title,
    /// Öğenin tamamlanma durumu (zorunlu)
    required this.isDone,
    /// Durum değiştirme işlevi (zorunlu)
    required this.toggleStatus,
    /// Öğe silme işlevi (zorunlu)
    required this.deleteItem,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// Anahtar, öğeyi benzersiz bir şekilde tanımlamak için kullanılır
      key: Key(title),
      /// Kartın üzerine tıklanınca öğeyi silme işlevini çağırıyoruz
      onTap: deleteItem,
      child: Card(
        /// Kartın rengini duruma göre ayarlıyoruz
        color: isDone ? Colors.green.shade50 : Colors.white,
        /// Kartın gölge seviyesini ayarlıyoruz
        elevation: isDone ? 1 : 10,
        /// Kartın gölge rengini tema rengi olarak ayarlıyoruz
        shadowColor: Theme.of(context).primaryColor,
        /// Kartın kenar yuvarlatmasını ayarlıyoruz
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          /// Öğe başlığı
          title: Text(
            title,
            /// Başlık rengini ve stilini duruma göre ayarlıyoruz
            style: TextStyle(
              color: Colors.black,
              decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          /// Checkbox
          trailing: Checkbox(
            /// Checkbox'un değeri öğenin tamamlanma durumuna göre ayarlanıyor
            value: isDone,
            /// Aktif renk
            activeColor: Colors.green,
            /// Checkbox durumu değiştiğinde çağrılacak işlev
            onChanged: toggleStatus,
          ),
        ),
      ),
    );
  }
}
