import 'package:bcare/Service/prediction_service.dart';
import 'package:bcare/model/questions.dart';
import 'package:bcare/prediksi/ambilphoto.dart';
import 'package:flutter/material.dart';

enum Jawaban {
  A,
  B,
  C,
  D,
}

class Pertanyaan2 extends StatefulWidget {
  const Pertanyaan2({Key? key}) : super(key: key);

  @override
  State<Pertanyaan2> createState() => _Pertanyaan2State();
}

class _Pertanyaan2State extends State<Pertanyaan2> {
  List<Questions> listQ = [];
  bool isLoading = true;
  late Map<int, String?> answer;

  Future<void> sendKuisioner() async {
    try {
      final response = await PredictionService.submitKuisioner(
          answer[0].toString(),
          answer[1].toString(),
          answer[2].toString(),
          answer[3].toString(),
          answer[4].toString(),
          answer[5].toString(),
          answer[6].toString(),
          answer[7].toString(),
          answer[8].toString(),
          answer[9].toString());
      if (response['code'] == 200) {
        _showTrueSnackbar(response['message'].toString());
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => AmbilFoto()));
      } else {
        _showErrorSnackbar(response['message'].toString());
      }
    } catch (e) {
      _showErrorSnackbar(e.toString());
    }
  }

  void getAllQuestion() async {
    final result = await PredictionService.fetchQuestions();
    listQ = result;
    setState(() {});
    isLoading = false;

    // Inisialisasi map jawaban
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   for (int i = 0; i < listQ.length; i++) {
    //     answer[i] = null;
    //   }
    // }

    // );
  }

  void _showTrueSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blue[300],
      duration: Duration(seconds: 3),
    ));
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    ));
  }

  @override
  void initState() {
    super.initState();
    answer = {};
    getAllQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[400],
          leading: Container(),
          title: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              'Mengisi Kuisioner',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "Mohon isi sesuai dengan kondisi saat ini",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ),
                Divider(color: Colors.grey),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: isLoading == true
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: listQ.length,
                            itemBuilder: (context, index) {
                              final item = listQ[index];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Q${item.id}. ${item.question} ?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    softWrap: true,
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RadioListTile(
                                    value: 'A',
                                    groupValue: answer[index]?.toString(),
                                    activeColor: Colors.amberAccent,
                                    onChanged: (val) {
                                      if (val != null) {
                                        // Memeriksa apakah jawaban yang dipilih sama dengan jawaban sebelumnya
                                        if (answer[index] != val) {
                                          setState(() {
                                            answer[index] = val as String?;
                                          });
                                        } else {
                                          setState(() {
                                            // Jika jawaban yang dipilih sama dengan jawaban sebelumnya, atur ke null
                                            answer[index] = null;
                                          });
                                        }
                                      }
                                    },
                                    title: Text('${item.opsi_1}'),
                                  ),
                                  RadioListTile(
                                    value: 'B',
                                    groupValue: answer[index]?.toString(),
                                    activeColor: Colors.amberAccent,
                                    onChanged: (val) {
                                      if (val != null) {
                                        // Memeriksa apakah jawaban yang dipilih sama dengan jawaban sebelumnya
                                        if (answer[index] != val) {
                                          setState(() {
                                            answer[index] = val as String?;
                                          });
                                        } else {
                                          setState(() {
                                            // Jika jawaban yang dipilih sama dengan jawaban sebelumnya, atur ke null
                                            answer[index] = null;
                                          });
                                        }
                                      }
                                    },
                                    title: Text('${item.opsi_2}'),
                                  ),
                                  RadioListTile(
                                    value: 'C',
                                    groupValue: answer[index]?.toString(),
                                    activeColor: Colors.amberAccent,
                                    onChanged: (val) {
                                      if (val != null) {
                                        // Memeriksa apakah jawaban yang dipilih sama dengan jawaban sebelumnya
                                        if (answer[index] != val) {
                                          setState(() {
                                            answer[index] = val as String?;
                                          });
                                        } else {
                                          setState(() {
                                            // Jika jawaban yang dipilih sama dengan jawaban sebelumnya, atur ke null
                                            answer[index] = null;
                                          });
                                        }
                                      }
                                    },
                                    title: Text('${item.opsi_3}'),
                                  ),
                                  RadioListTile(
                                    value: 'D',
                                    groupValue: answer[index]?.toString(),
                                    activeColor: Colors.amberAccent,
                                    onChanged: (val) {
                                      if (val != null) {
                                        // Memeriksa apakah jawaban yang dipilih sama dengan jawaban sebelumnya
                                        if (answer[index] != val) {
                                          setState(() {
                                            answer[index] = val as String?;
                                          });
                                        } else {
                                          setState(() {
                                            // Jika jawaban yang dipilih sama dengan jawaban sebelumnya, atur ke null
                                            answer[index] = null;
                                          });
                                        }
                                      }
                                    },
                                    title: Text('${item.opsi_4}'),
                                  ),
                                ],
                              );
                            })),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(250.0, 40.0),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: sendKuisioner,
                    child: Text(
                      'Selanjutnya',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ))
              ],
            )),
      ),
    );
  }
}
