import 'package:bcare/home.dart';
import 'package:bcare/menu.dart';
import 'package:bcare/profile.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class LayoutNav extends StatefulWidget {
  const LayoutNav();

  @override
  State<LayoutNav> createState() => _LayoutNavState();
}

class _LayoutNavState extends State<LayoutNav> {
  List<Widget> pages = [HalamanUtamaPage(), BcareMenu(), Profile()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: pages[currentIndex],
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
            Icons.person,
            color: Colors.black,
            size: 32,
          )),
        ],
        onTap: (int i) {
          setState(() => currentIndex = i);
          //print("PAGES : $i");
          pages[i];
        },
      ),
    );
  }
}
