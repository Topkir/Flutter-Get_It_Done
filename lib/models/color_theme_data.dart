import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier {
  /// Yeşil renk teması verileri
  ThemeData _greenTheme = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    //accentColor: Colors.green,
    appBarTheme: AppBarTheme(
      color: Colors.green,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,  /// Platform yoğunluğu
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
    ),
  );

  /// Kırmızı renk teması verileri
  ThemeData _redTheme = ThemeData(
    primaryColor: Colors.red,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    //accentColor: Colors.red,
    appBarTheme: AppBarTheme(
      color: Colors.red,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,  /// Platform yoğunluğu
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
    ),
  );

  /// Seçilen renk teması verileri (başlangıçta yeşil olarak ayarlanmış)
  ThemeData _selectedThemeData = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    accentColor: Colors.green,
    appBarTheme: AppBarTheme(
      color: Colors.green,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,  /// Platform yoğunluğu
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
    ),
  );


  bool _isGreen = true;
  static SharedPreferences? _sharedPref;

  /// Tema değiştirme işlevi
  void switchTheme(bool selected) {
    _isGreen = selected;
    saveThemeToSharedPref(selected);
    /// Tema değişikliği bildiriliyor
    notifyListeners();
  }

  /// diğer sayfalara erişimi _isGreen ile erişimi kapattık ve diğer sayfalara ulaşabilmek için get methodunu kullandık.
  bool get isGreen => _isGreen;

  /// Seçilen tema verilerini döndürme işlevi
  ThemeData get selectedThemeData => _isGreen? _greenTheme : _redTheme;

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref (bool value){
    _sharedPref?.setBool('themeData', value);
  }


  void loadThemeFromSharedPref (){
    /// getBool null ise true
    _isGreen = _sharedPref?.getBool('themeData')?? true;
  }


}
