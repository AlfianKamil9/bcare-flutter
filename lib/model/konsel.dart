class Konsel {
  final int id;
  final int harga_konseling;
  final String deskripsi_konseling;
  final String image_konseling;
  final String title_konseling;

  Konsel({
    required this.harga_konseling,
    required this.deskripsi_konseling,
    required this.image_konseling,
    required this.title_konseling,
    required this.id,
  });

  factory Konsel.fromJson(Map<String, dynamic> json) {
    return Konsel(
      harga_konseling: json['harga_konseling'],
      image_konseling: json['image_konseling'],
      deskripsi_konseling: json['deskripsi_konseling'],
      title_konseling: json['title_konseling'],
      id: json['id'],
    );
  }
}
