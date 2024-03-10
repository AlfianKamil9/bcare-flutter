import 'package:bcare/home.dart';
import 'package:bcare/infoKuisioner.dart';
import 'package:flutter/material.dart';

class BcareMenu extends StatelessWidget {
  const BcareMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BcareMenus(),
      routes: {'/home': (context) => HalamanUtamaPage()},
    );
  }
}

class BcareMenus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back_ios_rounded)),
        title: Padding(
            padding: EdgeInsets.only(left: 100.0),
            child: Image.asset(
              'assets/images/BCare.png',
              height: 20,
            )),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => {},
                child: Container(
                  width: 150,
                  height: 150,
                  child: Card(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.support_agent,
                              color: Colors.blue[400],
                              size: 60,
                            ),
                            Text(
                              'Konseling dengan Konselor',
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[400]),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => InfoKuisioner()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  child: Card(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.health_and_safety_outlined,
                              color: Colors.pink[400],
                              size: 60,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Identifikasi dini Baby Blues',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink[400]),
                            ),
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
