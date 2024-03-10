import 'package:bcare/menu.dart';

import 'artikel.dart';
import 'pilihanMasuk.dart';
import 'register.dart';
import 'home.dart';
import 'infoKuisioner.dart';
import 'login.dart';
import 'profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isLogin = true;
    if (isLogin == true) {
      return MaterialApp(
        home: HalamanUtamaPage(),
        initialRoute: '/home',
        routes: {
          '/home': (context) => HalamanUtamaPage(),
          '/artikel': (context) => DetailArtikel(),
          '/persiapan-prediksi': (context) => InfoKuisioner(),
          '/profile': (context) => Profile()
        },
      );
    } else {
      return MaterialApp(
        home: LoginPage(),
        initialRoute: '/pilihan-masuk',
        routes: {
          '/login': (context) => LoginPage(),
          '/pilihan-masuk': (context) => PilihanMasukPage(),
          '/register': (context) => RegisterPage()
        },
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [HalamanUtamaPage(), BcareMenu(), Profile()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
    );
  }
}
