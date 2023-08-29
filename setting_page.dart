import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_done_ver0/models/color_theme_data.dart';
import 'package:provider/provider.dart';

/// Ayarlar sayfası bileşeni
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tema Seçimi Yapınız'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      /// Ana gövde kısmını SwitchCard bileşeni ile dolduruyoruz
      body: SwitchCard(),
    );
  }
}

/// Anahtar durumunu içeren bileşen (SwitchCard)
class SwitchCard extends StatefulWidget {
  @override
  State<SwitchCard> createState() => _SwitchCardState();
}

/// Anahtar durumunu yöneten durum sınıfı (_SwitchCardState)
class _SwitchCardState extends State<SwitchCard> {
  late bool _value = true;

  @override
  Widget build(BuildContext context) {
    /// Yeşil metin
    Text greentext = Text('Green', style: TextStyle(color: Colors.green));
    /// Kırmızı metin
    Text redtext = Text('Red', style: TextStyle(color: Colors.red));

    /// Ana kartı oluşturuyoruz ve geri döndürüyoruz
    return buildCard(greentext, redtext, context);
  }

  /// Kartı oluşturan işlev
  Card buildCard(Text greentext, Text redtext, BuildContext context) {
    return Card(
      /// Anahtar durumu geçirilmiş kartı oluşturuyoruz
      child: buildSwitchListTile(greentext, redtext, context),
    );
  }

  /// Anahtar durumunu içeren listeden kartı oluşturan işlev
  SwitchListTile buildSwitchListTile(Text greentext, Text redtext, BuildContext context) {
    return SwitchListTile(
      /// Anahtar durumu metni (eğer açıksa yeşil, değilse kırmızı)
      subtitle: _value ? greentext : redtext,
      /// Anahtar durumu değeri
      value: _value,
      /// Anahtar durumu değiştikçe yapılacak işlev
      onChanged: (bool value) {
        setState(() {
          _value = value;
        });
        /// Renk temasını değiştirme işlevini çağırıyoruz
        Provider.of<ColorThemeData>(context, listen: false).swichTheme(value);
      },
      title: Text(
        'Change Theme Color',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
