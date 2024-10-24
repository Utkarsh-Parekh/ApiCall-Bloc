
import 'package:meta/meta.dart';
import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
   int? userId;
   int? id;
   String? title;
   String? Error;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.Error
  });

  Post copyWith({
    int? userId,
    int? id,
    String? title,
    String? Error
  }) =>
      Post(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        Error: Error ?? this.Error,
      );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    Error: json["Error"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "Error" : Error,
  };

  Post.withError(String Message){
    Error = Message;
  }
}
