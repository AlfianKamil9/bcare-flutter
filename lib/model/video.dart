class Videos {
  final int id;
  final String link_video;
  final String deskripsi_video;
  final String thumbnail_video;
  final String title_video;

  Videos({
    required this.link_video,
    required this.deskripsi_video,
    required this.thumbnail_video,
    required this.title_video,
    required this.id,
  });

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
      link_video: json['link_video'],
      title_video: json['title_video'],
      deskripsi_video: json['deskripsi_video'],
      thumbnail_video: json['thumbnail_video'],
      id: json['id'],
    );
  }
}
