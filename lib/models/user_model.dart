import 'package:flutter/material.dart';

class User{
  final String id;
  final String username;
  final String password;
  final String email;
  final String imageUrl;

  const User({
    @required this.id,
    @required this.username,
    @required this.password,
    @required this.email,
    @required this.imageUrl
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],      
      password: json['password'],
      email: json['email'],
      imageUrl: json['imageUrl'],
    );
  }
}