class PemesananKonseling {
  final int id;
  final int userId;
  final String status;
  final String reference_code;
  final String dateline_transfer;
  final String konseling_date;
  final String konseling_time;
  final String konselor;
  final int total_price;
  final String title_konseling;
  final String image_konseling;
  final String deskripsi_konseling;
  final String profile_konselor;
  final String link_zoom;

  PemesananKonseling(
      {required this.id,
      required this.userId,
      required this.status,
      required this.reference_code,
      required this.dateline_transfer,
      required this.konseling_date,
      required this.konseling_time,
      required this.konselor,
      required this.title_konseling,
      required this.deskripsi_konseling,
      required this.total_price,
      required this.link_zoom,
      required this.image_konseling,
      required this.profile_konselor});

  factory PemesananKonseling.fromJson(Map<String, dynamic> json) {
    return PemesananKonseling(
      id: json['id'],
      userId: json['userId'],
      status: json['status'],
      link_zoom: json['link_zoom'] ?? 'null',
      reference_code: json['reference_code'],
      dateline_transfer: json['dateline_transfer'],
      konseling_date: json['konseling_date'],
      konseling_time: json['konseling_time'],
      konselor: json['Konseling']['konselor']['name_konselor'],
      total_price: json['total_price'],
      title_konseling: json['Konseling']['title_konseling'],
      image_konseling: json['Konseling']['image_konseling'],
      deskripsi_konseling: json['Konseling']['deskripsi_konseling'],
      profile_konselor: json['Konseling']['konselor']['profile_konselor'],
    );
  }
}
