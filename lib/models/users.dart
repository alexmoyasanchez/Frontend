
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final String id;
  final String username;
  final String password;
  final String email;

  User({@required this.id, @required this.username, @required this.password, @required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],      
      password: json['password'],
      email: json['email'],
    );
  }
}