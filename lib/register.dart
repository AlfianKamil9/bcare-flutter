import 'package:bcare/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Register(),
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/pilihan.png', // Replace with your image path
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/BCare.png',
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Optional: Set border corner radius
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 5.0),
                          )),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Optional: Set border corner radius
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 5.0),
                          )),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Email Keluarga',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Optional: Set border corner radius
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 5.0),
                          )),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Optional: Set border corner radius
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 5.0),
                          )),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Konfirmasi Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Optional: Set border corner radius
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 5.0),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250.0, 60.0),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                    print('Register clicked');
                  },
                  child: const Text('Daftar',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25))),
            ],
          ),
        ),
      ],
    ));
  }
}
