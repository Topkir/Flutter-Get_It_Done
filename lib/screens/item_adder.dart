import 'package:flutter/material.dart';
import 'package:get_it_done_ver0/models/items_data.dart';
import 'package:provider/provider.dart';

class ItemAdder extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      /// Ekran klavyesi açıldığında alt kısımda oluşturulan padding
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Metin girişi alanı
              TextField(
                /// Minimum satır sayısı
                minLines: 1,
                /// Maksimum satır sayısı
                maxLines: 3,
                /// Metin denetleyicisi
                controller: textController,
                /// Metin değiştiğinde yapılacak eylem
                onChanged: (value) {
                  print(textController.text);
                },
                /// Metin stili
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  /// Metin giriş alanının görünümünü oluşturuyoruz
                  border: OutlineInputBorder(),
                  /// Metin giriş alanının etiketi
                  labelText: 'Add Item',
                  /// Metin giriş alanının içindeki ipucu
                  hintText: '...',
                ),
                /// Metin giriş alanına otomatik odaklanma
                autofocus: true,
              ),
              /// 'ADD' butonu
              TextButton(
                onPressed: () {
                  /// Yeni öğe eklemek için ItemData sağlayıcısını kullanıyoruz
                  Provider.of<ItemData>(context, listen: false)
                      .addItem(textController.text);
                  /// Bottom Sheet'i kapatıyoruz
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                child: Text(
                  'ADD',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
