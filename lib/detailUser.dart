import 'package:bcare/Service/auth_service.dart';
import 'package:bcare/Service/token_service.dart';
import 'package:bcare/pilihanMasuk.dart';
import 'package:flutter/material.dart';

class MyProfileUser extends StatefulWidget {
  const MyProfileUser({super.key});

  @override
  State<MyProfileUser> createState() => _MyProfileUserState();
}

class _MyProfileUserState extends State<MyProfileUser> {
  String name = '';
  String email = '';

  Future<void> userToLogout() async {
    try {
      final result = await Authentikasi.logout();
      if (result['code'] == 200) {
        await TokenManager.deleteToken();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => PilihanMasukPage()));
      } else {
        _showErrorSnackbar(result['message']);
      }
    } catch (e) {
      _showErrorSnackbar(e.toString());
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    ));
  }

  void fetchUserData() async {
    name = (await TokenManager.getName())!;
    email = (await TokenManager.getEmail())!;
    print("Name : $name , Email : $email");
    setState(() {
      name = name;
      email = email;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded)),
          backgroundColor: const Color.fromARGB(255, 246, 248, 249),
          title: Padding(
              padding: EdgeInsets.only(left: 100.0),
              child: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))),
      body: Stack(children: <Widget>[
        Image.asset(
          'assets/images/pilihan-bg-2.png', // Replace with your image path
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 310,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 4,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            border: Border.all(
                                color: const Color.fromARGB(255, 241, 134, 170),
                                width: 4),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(500),
                            child: Image.asset(
                              "assets/images/profile-img.jpg",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "${name}",
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "${email}",
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 20),
                              Text('Family Mail',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 117, 117, 117),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                "${email}",
                                softWrap: true,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              fixedSize: Size(2000, 50),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 221, 221, 221),
                                  width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {},
                          child: Text(
                            "Ubah Password",
                            style: TextStyle(
                                color: Color.fromARGB(255, 76, 76, 76),
                                fontSize: 16),
                          ))),
                ],
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              fixedSize: Size(2000, 50),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 221, 221, 221),
                                  width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {},
                          child: Text(
                            "Ubah Family Email",
                            style: TextStyle(
                                color: Color.fromARGB(255, 76, 76, 76),
                                fontSize: 16),
                          ))),
                ],
              ),
            ),
            SizedBox(height: 25),
            TextButton(
                onPressed: userToLogout,
                child: Text(
                  "Keluar",
                  style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 255, 0, 0)),
                )),
            Text(
              "Bcare v.1.1.0",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            )
          ],
        ),
      ]),
    );
  }
}
