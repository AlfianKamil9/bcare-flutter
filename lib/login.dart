import 'package:bcare/Service/auth_service.dart';
import 'package:bcare/Service/token_service.dart';
import 'package:bcare/home.dart';
import 'package:bcare/pilihanMasuk.dart';
import 'package:bcare/register.dart';
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
        print("DATA : ${result['name']}");
        await TokenManager.saveDetailUser(
            result['name']!.toString(), result['email']!.toString());
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
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => PilihanMasukPage()));
              },
              icon: Icon(Icons.arrow_back_ios_rounded)),
          backgroundColor: const Color.fromARGB(255, 246, 248, 249),
        ),
        body: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/pilihan-bg.png', // Replace with your image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Masuk",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Email',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        autofocus: true,
                        controller: _emailController,
                        decoration: InputDecoration(
                            labelText: 'Masukkan Email Anda',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Optional: Set border corner radius
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 5.0),
                            )),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Password',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        autofocus: true,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Masukkan Password Anda',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Optional: Set border corner radius
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 5.0),
                            )),
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: ElevatedButton(
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text("Atau"),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Belum Memiliki akun?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterPage()));
                                  },
                                  child: Text(
                                    "Daftar",
                                    style: TextStyle(color: Colors.blue[400]),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
