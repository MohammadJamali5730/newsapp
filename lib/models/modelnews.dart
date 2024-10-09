import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Modelnews {
String author;
String title;
String description;
String url;
String image;
String publishedAt;
String content;
  Modelnews({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.content,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'image': image,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory Modelnews.fromMap(Map<String, dynamic> map) {
    return Modelnews(
      author: map['author'] ?? ' no author',
      title: map['title'] ?? ' no other',
      description: map['description'] ?? 'no description',
      url: map['url'] ?? ' no url',
      image: map['image'] ?? ' no urlToImage',
      publishedAt: map['publishedAt'] ?? ' no publishedAt',
      content: map['content'] ?? ' no content',
    );
  }

  String toJson() => json.encode(toMap());

  factory Modelnews.fromJson(String source) => Modelnews.fromMap(json.decode(source) as Map<String, dynamic>);
}
