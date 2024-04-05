import 'package:bcare/profile.dart';
import 'package:bcare/Service/konseling_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailKonseling extends StatefulWidget {
  final String konselingId;

  const DetailKonseling(this.konselingId);

  @override
  State<DetailKonseling> createState() => _DetailKonselingState();
}

class _DetailKonselingState extends State<DetailKonseling> {
  late Future<Map<String, dynamic>> _futureDetailKonseling;
  String _selectedTime = '12:00:00';
  DateTime _selectedDate = DateTime.now().add(Duration(days: 1));

  // SET TIME CHANGES
  void _onTimeChanged(val) {
    setState(() {
      _selectedTime = val.toString();
    });
  }

  Future<void> _createOrder() async {
    try {
      final response = await KonselingService.submitOrderKonseling(
          widget.konselingId.toString(),
          _selectedTime.toString(),
          DateFormat('yyyy-MM-dd').format(_selectedDate).toString());
      if (response['code'] == 201) {
        showDialog(
            barrierColor: const Color.fromARGB(136, 255, 255, 255),
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Notifikasi Pesanan"),
                  content: Text(
                    'Pemesanan anda berhasil, Periksa Email anda dan lengkapi Pembayaran',
                    softWrap: true,
                  ),
                  contentPadding: EdgeInsets.all(20.0),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        child: Text("Close"))
                  ],
                ));
      } else {
        _showErrorSnackbar(response['message'].toString());
      }
    } catch (e) {
      _showErrorSnackbar(e.toString());
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 3),
    ));
  }

  @override
  void initState() {
    super.initState();
    _futureDetailKonseling =
        KonselingService.fetchDetailKonseling(widget.konselingId);
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
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        backgroundColor: Colors.blue[400],
        title: Center(
          child: Text(
            'Pesan Konseling',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: ListView(children: <Widget>[
        Container(
            child: FutureBuilder<Map<String, dynamic>>(
                future: _futureDetailKonseling,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 300),
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Memuat")
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Error")],
                    ));
                  } else {
                    final item = snapshot.data!;
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Layanan :",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            "${item['title_konseling']}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "Konselor :",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            item['konselor']['name_konselor'],
                            softWrap: true,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "Deskripsi :",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            item['deskripsi_konseling'],
                            softWrap: true,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "Atur Jadwal Konsultasi",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "Jam Konsultasi",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  child: RadioListTile(
                                    activeColor: Colors.blue,
                                    title: const Text(
                                      '12.00 WIB',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    value: '12:00:00',
                                    groupValue: _selectedTime,
                                    onChanged: _onTimeChanged,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  child: RadioListTile(
                                    activeColor: Colors.blue,
                                    title: const Text(
                                      '15.00 WIB',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    value: '15:00:00',
                                    groupValue: _selectedTime,
                                    onChanged: _onTimeChanged,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Card(
                                  child: RadioListTile(
                                    activeColor: Colors.blue,
                                    title: const Text(
                                      '19.00 WIB',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    value: '19:00:00',
                                    groupValue: _selectedTime,
                                    onChanged: _onTimeChanged,
                                  ),
                                ),
                              ),
                              Expanded(child: Container())
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Tanggal Konsultasi",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      DateFormat('EEEE, dd MMMM yyy')
                                          .format(_selectedDate),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: _selectedDate,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2025),
                                        selectableDayPredicate: (day) {
                                          if ((day.isBefore(DateTime.now()
                                              .add(Duration(days: 7))))) {
                                            return true;
                                          }
                                          return false;
                                        }).then((value) {
                                      if (value != null)
                                        setState(() => _selectedDate = value);
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(150.0, 40.0),
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Text("Atur Tanggal",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Harga :",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Rp. ${item['harga_konseling']}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0, // Line thickness
                            color: Colors.grey, // Line color
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: _createOrder,
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(250.0, 45.0),
                                      backgroundColor:
                                          Color.fromARGB(255, 212, 212, 212),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text(
                                      "Pesan Sekarang",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
                  }
                })),
      ]),
    );
  }
}
