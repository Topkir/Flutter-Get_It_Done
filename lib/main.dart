import 'package:flutter/material.dart';
import 'package:get_it_done_ver0/models/item.dart';
import 'package:get_it_done_ver0/models/items_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import './screens/home_page.dart';
import 'models/color_theme_data.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemData().createPrefObject();

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
  const MyApp({key});

  @override
  Widget build(BuildContext context) {

  // Provider.of<ColorThemeData>(context).loadThemeFromSharedPref();
  // Provider.of<ItemData>(context).loadItemsFromSharedPref();

    return Consumer2<ItemData,ColorThemeData>(
      builder: (context, itemData, colorThemeData, child) {

        itemData.loadItemsFromSharedPref();
        colorThemeData.loadThemeFromSharedPref();

        return MaterialApp(
          debugShowCheckedModeBanner: false,

          /// Seçilen tema verilerini sağlayıcıdan al
          theme: Provider
              .of<ColorThemeData>(context)
              .selectedThemeData,

          /// Ana sayfayı oluşturan widget'ı belirt
          home: SplashWidget(),
        )
        ;
      }
    );
  }
}


class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds:  HomePage(),
      title:  Text(
        'Get It Done',
        style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image:  Image.asset('assets/splash_image.png'),
      photoSize: 100,
      backgroundColor: Colors.white,
      loaderColor: Colors.green,
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
