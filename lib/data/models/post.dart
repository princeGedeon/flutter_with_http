// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

class Post {
  Post({
    this.id,
    this.content,
    this.title,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  String? id;
  String? content;
  String? title;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"] == null ? null : json["id"],
    content: json["content"] == null ? null : json["content"],
    title: json["title"] == null ? null : json["title"],
    userId: json["user_id"] == null ? null : json["user_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );
}

class User {
  User({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.username,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? email;
  String? username;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    email: json["email"] == null ? null : json["email"],
    username: json["username"] == null ? null : json["username"],
  );
}