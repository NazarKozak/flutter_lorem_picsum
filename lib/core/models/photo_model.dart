class Photo {
  Photo({
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

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
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
}
