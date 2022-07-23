class Soccer {
  String? title;
  String? description;
  String? imageUrl;
  Soccer({
    this.title,
    this.description,
    this.imageUrl,
  });

  Soccer.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    imageUrl = json['urlToImage'];
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'urlToImage': imageUrl,
    };
  }
}
