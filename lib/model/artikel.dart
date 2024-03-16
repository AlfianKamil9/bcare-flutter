class Artikel {
  final int id;
  final int categoryContentId;
  final int babyBluesCategoryId;
  final String title;
  final String content;
  final String image;
  final String subTitle;

  Artikel({
    required this.title,
    required this.content,
    required this.image,
    required this.subTitle,
    required this.id,
    required this.categoryContentId,
    required this.babyBluesCategoryId,
  });

  factory Artikel.fromJson(Map<String, dynamic> json) {
    return Artikel(
      title: json['title'],
      content: json['content'],
      image: json['image'],
      subTitle: json['subTitle'],
      id: json['id'],
      categoryContentId: json['categoryContentId'],
      babyBluesCategoryId: json["babybluesCategoryId"],
    );
  }
}
