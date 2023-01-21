// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

class Comment {
  Comment({
    this.id,
    this.content,
    this.userId,
    this.postId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  String? id;
  String? content;
  String? userId;
  String? postId;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"] == null ? null : json["id"],
    content: json["content"] == null ? null : json["content"],
    userId: json["user_id"] == null ? null : json["user_id"],
    postId: json["post_id"] == null ? null : json["post_id"],
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
