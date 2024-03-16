import 'package:bcare/Service/auth_service.dart';
import 'package:bcare/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _familyEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confPasswordController = TextEditingController();
  //

  Future<void> registerUser() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String familyEmail = _familyEmailController.text;
    final String password = _passwordController.text;
    final String confPassword = _confPasswordController.text;

    try {
      final result = await Authentikasi.register(
          name, email, familyEmail, password, confPassword);
      if (result['code'] == 201) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      } else {
        _showErrorSnackbar(result['message'].toString());
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
    return MaterialApp(
      home: Scaffold(
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
                      SizedBox(height: 10),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            labelText: 'Nama Lengkap',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Optional: Set border corner radius
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 5.0),
                            )),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _familyEmailController,
                        decoration: InputDecoration(
                            labelText: 'Email Keluarga',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Optional: Set border corner radius
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 5.0),
                            )),
                      ),
                      SizedBox(height: 10),
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
                      SizedBox(height: 10),
                      TextField(
                        controller: _confPasswordController,
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
                SizedBox(height: 28),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(250.0, 60.0),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: registerUser,
                    child: const Text('Daftar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25))),
              ],
            ),
          ),
        ],
      )),
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}
