import 'package:bcare/Service/auth_service.dart';
import 'package:bcare/Service/token_service.dart';
import 'package:bcare/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    try {
      final result = await Authentikasi.login(email, password);
      if (result['code'] == 200) {
        await TokenManager.saveToken(result['token']);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HalamanUtamaPage()));
      }
    } catch (e) {
      print(e);
      _showErrorSnackbar(e.toString());
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    ));
  }

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
                      controller: _emailController,
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
                      controller: _passwordController,
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
                  onPressed: loginUser,
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
