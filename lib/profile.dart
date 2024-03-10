import 'package:bcare/tentangkami.dart';

import 'home.dart';
import 'menu.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Widget> pages = [HalamanUtamaPage(), BcareMenu(), Profile()];

  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Image.asset(
                "assets/images/profile-img.jpg",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Dewi Aulia Mahardika",
              softWrap: true,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Text(
              "dewiauliam9@gmail.com",
              softWrap: true,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Riwayat Pemesanan",
                      softWrap: true,
                      textAlign: TextAlign.center,
                    )),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text("Edit Profile"))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TentangKami()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: Size(2000, 50),
                    side: BorderSide(
                        color: Color.fromARGB(255, 221, 221, 221), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Tentang Kami",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    )
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: Size(2000, 50),
                    side: BorderSide(color: Colors.red, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "Bcare v.1.1.0",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            )
          ],
        ),
      )),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Color(0xFFC5C5C5),
        color: Color.fromARGB(255, 211, 80, 124),
        activeColor: Colors.pink[300],
        initialActiveIndex: 1,
        height: 60,
        items: [
          TabItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 32,
            ),
          ),
          TabItem(
              icon: Icon(
            Icons.health_and_safety_sharp,
            color: Colors.white,
            size: 40,
          )),
          TabItem(
              icon: Icon(
            Icons.library_books,
            color: Colors.black,
            size: 32,
          )),
        ],
        onTap: (int i) {
          setState(() => currentIndex = i);
          Navigator.push(
              context, MaterialPageRoute(builder: (i) => pages[currentIndex]));
        },
      ),
    );
  }
}