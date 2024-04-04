class Konselings {
  final int id;
  final int harga_konseling;
  final String deskripsi_konseling;
  final String image_konseling;
  final String title_konseling;
  final String konselor;

  Konselings({
    required this.harga_konseling,
    required this.deskripsi_konseling,
    required this.image_konseling,
    required this.title_konseling,
    required this.id,
    required this.konselor,
  });

  factory Konselings.fromJson(Map<String, dynamic> json) {
    return Konselings(
      harga_konseling: json['harga_konseling'],
      image_konseling: json['image_konseling'],
      deskripsi_konseling: json['deskripsi_konseling'],
      title_konseling: json['title_konseling'],
      konselor: json['konselor']['name_konselor'],
      id: json['id'],
    );
  }
}
