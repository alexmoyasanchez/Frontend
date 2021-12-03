import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/components/body.dart';
import 'package:flutter_auth/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


Future<User> createUser(String username, String password, String email) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:3000/usuarios/new'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id' : null,
      'username': username,
      'password' : password,
      'email' : email,
      'imageUrl': null,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Error al registrar usuario.');
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
