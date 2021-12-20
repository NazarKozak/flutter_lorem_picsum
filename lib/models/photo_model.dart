import 'dart:convert';

class Picture {
  Picture({
    required this.id,
    this.author = "",
    this.width = 0,
    this.height = 0,
    this.url = "",
    this.downloadUrl = "",
  });

  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    id: json["id"],
    author: json["author"],
    width: json["width"],
    height: json["height"],
    url: json["url"],
    downloadUrl: json["download_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author": author,
    "width": width,
    "height": height,
    "url": url,
    "download_url": downloadUrl,
  };

  List<Picture> picturesFromJson(String str) => List<Picture>.from(json.decode(str).map((x) => Picture.fromJson(x)));
}
