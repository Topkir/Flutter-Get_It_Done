import 'package:flutter/material.dart';
import 'package:get_it_done_ver0/models/items_data.dart';
import 'package:provider/provider.dart';
import './screens/home_page.dart';
import 'models/color_theme_data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        /// İtem verileri için ChangeNotifierProvider'ı oluştur
        ChangeNotifierProvider<ItemData>(
          create: (BuildContext context) => ItemData(),
        ),
        /// Renk temaları için ChangeNotifierProvider'ı oluştur
        ChangeNotifierProvider<ColorThemeData>(
          create: (BuildContext context) => ColorThemeData(),
        ),
      ],
      /// Uygulamayı çalıştır
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /// Seçilen tema verilerini sağlayıcıdan al
      theme: Provider.of<ColorThemeData>(context).selectedThemeData,
      /// Ana sayfayı oluşturan widget'ı belirt
      home: const HomePage(),
    );
  }
}

/// Yeşil renk teması verileri
ThemeData greenTheme = ThemeData(
  primaryColor: Colors.green,
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: Colors.green,
  accentColor: Colors.green,
  appBarTheme: AppBarTheme(
    color: Colors.green,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    headlineSmall: TextStyle(color: Colors.white),
    displaySmall: TextStyle(color: Colors.white),
  ),
);

/// Kırmızı renk teması verileri
ThemeData redTheme = ThemeData(
  primaryColor: Colors.red,
  primarySwatch: Colors.red,
  scaffoldBackgroundColor: Colors.red,
  accentColor: Colors.red,
  appBarTheme: AppBarTheme(
    color: Colors.red,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    headlineSmall: TextStyle(color: Colors.white),
    displaySmall: TextStyle(color: Colors.white),
  ),
);
