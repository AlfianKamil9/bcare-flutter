import 'package:bcare/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      routes: {
        '/masukHalamanUtama': (context) => MyHomePage(),
      },
    );
  }
}

class Login extends StatelessWidget {
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
                    Navigator.pushNamed(context, '/masukHalamanUtama');
                    print('Login clicked');
                  },
                  child: const Text('Masuk',
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
