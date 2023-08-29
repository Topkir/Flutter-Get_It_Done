import 'package:flutter/material.dart';

class ColorThemeData with ChangeNotifier {
  /// Yeşil renk teması verileri
  ThemeData _greenTheme = ThemeData(
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

  /// Kırmızı renk teması verileri
  ThemeData _redTheme = ThemeData(
    primaryColor: Colors.red,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    accentColor: Colors.red,
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

  bool isGreen = true;

  /// Tema değiştirme işlevi
  void swichTheme(bool selected) {
    _selectedThemeData = selected ? _greenTheme : _redTheme;
    isGreen = selected;
    /// Tema değişikliği bildiriliyor
    notifyListeners();
  }

  /// Seçilen tema verilerini döndürme işlevi
  ThemeData get selectedThemeData => _selectedThemeData;
}
