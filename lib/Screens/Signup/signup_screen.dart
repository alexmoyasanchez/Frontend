import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/components/body.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<User> createUser(String username, String password, String email) async {
  final response = await http.post(
    Uri.parse('http://147.83.7.157:3000/usuarios/new'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
      'email': email,
      'nombre': "",
      'edad': "",
      'descripcion': "",
      'imageUrl': "",
      'puntuacion': '0',
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception(S.current.wrongu);
  }
}

Future<User> UserAuthbyGoogle(String email, String id) async {
  final response = await http.post(
    Uri.parse('http://147.83.7.157:3000/usuarios/new'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      
      'email': email,
      'uid': id,
      'nombre': "",
      'edad': "",
      'descripcion': "",
      'imageUrl': "",
      'puntuacion': '0',
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception(S.current.wrongu);
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
