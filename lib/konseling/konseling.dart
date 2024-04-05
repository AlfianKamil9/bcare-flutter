import 'package:bcare/Service/konseling_service.dart';
import 'package:bcare/konseling/detailKonseling.dart';
import 'package:bcare/model/konseling.dart';
import 'package:flutter/material.dart';

class KonselingPage extends StatefulWidget {
  const KonselingPage({super.key});

  @override
  State<KonselingPage> createState() => _KonselingPageState();
}

class _KonselingPageState extends State<KonselingPage> {
  List<Konselings> listKonseling = [];
  bool isLoading = true;

  void getAllKonselings() async {
    final result = await KonselingService.fetchKonselings();
    listKonseling = result;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    getAllKonselings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        backgroundColor: Colors.blue[300],
        title: Center(
          child: Text(
            "Layanan Konseling",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isLoading == true
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Memuat")
                ],
              ))
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listKonseling.length,
                itemBuilder: (context, index) {
                  final item = listKonseling[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailKonseling(item.id.toString())));
                        },
                        child: Container(
                          child: Card(
                            color: Color.fromARGB(255, 255, 255, 255),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${item.title_konseling}",
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Oleh : ${item.konselor}",
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Rp. ${item.harga_konseling}",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 241, 134, 170),
                                          width: 4),
                                    ),
                                    width: 100,
                                    height: 80,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        "${item.image_konseling}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  );
                }),
      ),
    );
  }
}
