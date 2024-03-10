import 'package:bcare/home.dart';
import 'package:flutter/material.dart';

class DetailArtikel extends StatelessWidget {
  const DetailArtikel({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DetailsArtikel(), routes: {
      '/home': (context) => HalamanUtamaPage(),
    });
  }
}

class DetailsArtikel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back_ios_outlined)),
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, right: 70),
            child:
                Text('Artikel', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "6 Tips Jitu Mencegah Baby Blues Setelah Melahirkan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25,
              ),
              Image.asset('assets/images/image-artikel.png'),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    """
                  Lorem ipsum dolor sit amet consectetur. Ornare pulvinar nibh libero malesuada malesuada. Integer mi etiam tellus tellus felis venenatis enim. Turpis turpis fermentum egestas orci facilisis. Eleifend sit accumsan in ut viverra. Nunc cursus pellentesque bibendum non vel cursus facilisis volutpat. Laoreet porta sed ut scelerisque nulla feugiat netus. Gravida arcu in amet sapien adipiscing tortor varius eget. Id proin et eget leo duis eget et , consectetur. 
                  
                  At sem at ultrices felis eget tellus fames. A mauris sed mauris vulputate quam. Nulla in hendrerit tempor ultricies malesuada nisi at aliquet. Nisi feugiat mauris ipsum egestas facilisi in. Morbi donec odio tristique non suspendisse bibendum. Mi consectetur sed aliquam neque at adipiscing phasellus. Ultrices maecenas malesuada tincidunt leo nullam cursus quis viverra. Ornare cursus tempor porttitor nunc nec amet adipiscing congue. Quis viverra in vestibulum ultricies at mattis. 
                  
                  Sagittis vivamus tortor ultrices diam in enim nunc. Fames lectus lorem faucibus sit dui vestibulum. Dui quam vitae tincidunt convallis. Egestas consequat faucibus condimentum nunc blandit est amet aliquam. Vivamus hendrerit mauris nibh felis proin aliquam felis facilisis. Massa tempus mattis ut amet vitae egestas suscipit id. Amet viverra pulvinar enim lacus et.
                  """),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
