class Questions {
  final int id;
  final String question;
  final String opsi_1;
  final String opsi_2;
  final String opsi_3;
  final String opsi_4;

  Questions({
    required this.question,
    required this.opsi_1,
    required this.opsi_2,
    required this.opsi_3,
    required this.opsi_4,
    required this.id,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      opsi_1: json['opsi_1'],
      opsi_2: json['opsi_2'],
      opsi_3: json['opsi_3'],
      opsi_4: json['opsi_4'],
      id: json['id'],
      question: json['question'],
    );
  }
}
