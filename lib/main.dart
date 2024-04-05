import 'package:bcare/layoutNav.dart';
import 'package:flutter/material.dart';
import 'package:bcare/Service/token_service.dart';
import 'package:bcare/login.dart';
import 'package:bcare/pilihanMasuk.dart';
import 'package:bcare/profile.dart';
import 'package:bcare/register.dart';
import 'package:bcare/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: TokenManager.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return MaterialApp(
              home: LoginPage(),
              initialRoute: '/pilihan-masuk',
              routes: {
                '/login': (context) => LoginPage(),
                '/pilihan-masuk': (context) => PilihanMasukPage(),
                '/register': (context) => RegisterPage(),
              },
            );
          } else {
            final token = snapshot.data;
            if (token != null) {
              return MaterialApp(
                home: LayoutNav(),
                initialRoute: '/home',
                routes: {
                  '/bcare-menu': (context) => BcareMenu(),
                  '/home': (context) => LayoutNav(),
                  '/profile': (context) => Profile(),
                },
              );
            } else {
              return MaterialApp(
                home: LoginPage(),
                initialRoute: '/pilihan-masuk',
                routes: {
                  '/login': (context) => LoginPage(),
                  '/pilihan-masuk': (context) => PilihanMasukPage(),
                  '/register': (context) => RegisterPage(),
                },
              );
            }
          }
        }
      },
    );
  }
}
