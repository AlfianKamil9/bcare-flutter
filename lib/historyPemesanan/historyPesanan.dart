import 'package:bcare/Service/pemesanan_service.dart';
import 'package:bcare/historyPemesanan/detailPemesanan.dart';
import 'package:bcare/historyPemesanan/uploadBuktiPemesanan.dart';
import 'package:bcare/model/pemesanan.dart';
import 'package:flutter/material.dart';

class HistoryPesanan extends StatefulWidget {
  const HistoryPesanan({super.key});

  @override
  State<HistoryPesanan> createState() => _HistoryPesananState();
}

class _HistoryPesananState extends State<HistoryPesanan> {
  List<PemesananKonseling> listPesanan = [];
  bool isClicked1 = true;
  bool isClicked2 = false;
  bool isClicked3 = false;
  bool isClicked4 = false;
  bool isClicked5 = false;
  bool isLoading = true;

  void fetchAllPesanan() async {
    isLoading = false;
    final result = await PemesananKonselingService.fetchPesananAll();
    listPesanan = result;
    setState(() {});
    isClicked1 = true;
    isClicked2 = false;
    isClicked3 = false;
    isClicked4 = false;
    isClicked5 = false;
    isLoading = false;
  }

  void fetchProsesPesanan() async {
    isLoading = false;
    final result = await PemesananKonselingService.fetchPesananAll();
    listPesanan = result.where((item) => item.status == 'PENDING').toList();
    setState(() {});
    isClicked1 = false;
    isClicked2 = true;
    isClicked3 = false;
    isClicked4 = false;
    isClicked5 = false;
    isLoading = false;
    print("List Pesanan : ${listPesanan}");
  }

  void fetchReviewingPesanan() async {
    isLoading = false;
    final result = await PemesananKonselingService.fetchPesananAll();
    listPesanan = result.where((item) => item.status == 'REVIEWING').toList();
    setState(() {});
    isClicked1 = false;
    isClicked2 = false;
    isClicked3 = false;
    isClicked4 = false;
    isClicked5 = true;
    isLoading = false;
  }

  void fetchSuccessPesanan() async {
    isLoading = false;
    final result = await PemesananKonselingService.fetchPesananAll();
    listPesanan = result.where((item) => item.status == 'SUCCESS').toList();
    setState(() {});
    isClicked1 = false;
    isClicked2 = false;
    isClicked3 = true;
    isClicked4 = false;
    isClicked5 = false;
    isLoading = false;
  }

  void fetchKadaluarsaPesanan() async {
    isLoading = false;
    final result = await PemesananKonselingService.fetchPesananAll();
    listPesanan = result.where((item) => item.status == 'CANCELED').toList();
    setState(() {});
    isClicked1 = false;
    isClicked2 = false;
    isClicked3 = false;
    isClicked4 = true;
    isClicked5 = false;
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    fetchAllPesanan();
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
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "Riwayat Pemesanan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 40, // Atur tinggi sesuai kebutuhan Anda
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ElevatedButton(
                      onPressed: fetchAllPesanan,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isClicked1 == true ? Colors.blue : Colors.white,
                          fixedSize: Size(100, 25),
                          side: BorderSide(
                              color: const Color.fromARGB(255, 54, 136, 244),
                              width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text("Semua",
                          style: TextStyle(
                              color: isClicked1 ? Colors.white : Colors.blue))),
                  SizedBox(width: 15),
                  ElevatedButton(
                      onPressed: fetchProsesPesanan,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isClicked2 == true ? Colors.blue : Colors.white,
                          fixedSize: Size(130, 25),
                          side: BorderSide(
                              color: const Color.fromARGB(255, 54, 136, 244),
                              width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text("Butuh Bayar",
                          style: TextStyle(
                              color: isClicked2 ? Colors.white : Colors.blue))),
                  SizedBox(width: 15),
                  ElevatedButton(
                      onPressed: fetchReviewingPesanan,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isClicked5 == true ? Colors.blue : Colors.white,
                          fixedSize: Size(120, 25),
                          side: BorderSide(
                              color: const Color.fromARGB(255, 54, 136, 244),
                              width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text("Diproses",
                          style: TextStyle(
                              color: isClicked5 ? Colors.white : Colors.blue))),
                  SizedBox(width: 15),
                  ElevatedButton(
                      onPressed: fetchSuccessPesanan,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isClicked3 == true ? Colors.blue : Colors.white,
                          fixedSize: Size(100, 25),
                          side: BorderSide(
                              color: const Color.fromARGB(255, 54, 136, 244),
                              width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text("Selesai",
                          style: TextStyle(
                              color: isClicked3 ? Colors.white : Colors.blue))),
                  SizedBox(width: 15),
                  ElevatedButton(
                      onPressed: fetchKadaluarsaPesanan,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isClicked4 == true ? Colors.blue : Colors.white,
                          fixedSize: Size(120, 25),
                          side: BorderSide(
                              color: const Color.fromARGB(255, 54, 136, 244),
                              width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text("Kadaluarsa",
                          style: TextStyle(
                              color: isClicked4 ? Colors.white : Colors.blue))),
                  // Tambahkan container sesuai kebutuhan
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 1.0, // Line thickness
              color: Colors.grey, // Line color
              indent: 2.0, // Indentation from the left edge
              endIndent: 2.0, // Indentation from the right edge
            ),
            SizedBox(height: 10),
            Container(
              //KONTEN
              //color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.74,
              child: isLoading == true
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 5),
                          Text("data")
                        ],
                      ),
                    )
                  : listPesanan.isEmpty
                      ? Center(
                          child: Text(
                          'Tidak Ada Pesanan ditemukan',
                          softWrap: true,
                        ))
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: listPesanan.length,
                          itemBuilder: (context, index) {
                            final pesanan = listPesanan[index];
                            final isStatus = pesanan.status;
                            return Column(children: [
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${isStatus}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: isStatus ==
                                                            "CANCELED"
                                                        ? Colors.red[900]
                                                        : isStatus == 'SUCCESS'
                                                            ? Colors.green
                                                            : isStatus ==
                                                                    "PENDING"
                                                                ? Colors
                                                                    .amber[600]
                                                                : Colors.blue),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    height: 75,
                                                    child: Image.network(
                                                        "${pesanan.image_konseling}"),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${pesanan.title_konseling}",
                                                          textAlign:
                                                              TextAlign.start,
                                                          softWrap: true,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "Oleh: ${pesanan.konselor}",
                                                          textAlign:
                                                              TextAlign.start,
                                                          softWrap: true,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Divider(
                                                thickness:
                                                    1.0, // Line thickness
                                                color:
                                                    Colors.grey, // Line color
                                                indent:
                                                    2.0, // Indentation from the left edge
                                                endIndent:
                                                    2.0, // Indentation from the right edge
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Rp. ${pesanan.total_price}",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        DetailHistoryPemesanan(pesanan
                                                                            .reference_code
                                                                            .toString())));
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  side: BorderSide(
                                                                      width: 1,
                                                                      color: Colors
                                                                          .blue),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  )),
                                                          child: Text(
                                                            'Detail',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue),
                                                          )),
                                                      SizedBox(width: 8),
                                                      // ELSE IF JIKA SUDAH TRANSFER

                                                      Container(
                                                        child: isStatus ==
                                                                'PENDING'
                                                            ? ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder: (context) => UploadBuktiBayar(pesanan
                                                                              .reference_code
                                                                              .toString())));
                                                                },
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .blue,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                        )),
                                                                child: Text(
                                                                    'Bayar',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)))
                                                            : Container(),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                            ]);
                          }),
            ),
          ],
        ),
      ),
    );
  }
}
