import 'package:bcare/Service/auth_service.dart';
import 'package:bcare/login.dart';
import 'package:bcare/pilihanMasuk.dart';
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
              ListView(children: [
                Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Daftar",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(height: 15),
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
                          SizedBox(height: 15),
                          Text(
                            'Nama Lengkap',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            autofocus: true,
                            controller: _nameController,
                            decoration: InputDecoration(
                                labelText: 'Masukkan Nama Lengkap Anda',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Optional: Set border corner radius
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 5.0),
                                )),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Family Email',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            autofocus: true,
                            controller: _familyEmailController,
                            decoration: InputDecoration(
                                labelText: 'Masukkan Family Email Anda',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Optional: Set border corner radius
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 5.0),
                                )),
                          ),
                          SizedBox(height: 15),
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
                          SizedBox(height: 15),
                          Text(
                            'Konfirmasi Password',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            autofocus: true,
                            controller: _confPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Masukkan Konfirmasi Password Anda',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Optional: Set border corner radius
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 5.0),
                                )),
                          ),
                          SizedBox(height: 30),
                          Center(
                            child: ElevatedButton(
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
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text("Atau"),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Sudah Memiliki Akun?"),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      },
                                      child: Text(
                                        "Masuk",
                                        style:
                                            TextStyle(color: Colors.blue[400]),
                                      ))
                                ],
                              )
                            ],
                          )
                        ]))
              ])
            ],
          )),
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}
