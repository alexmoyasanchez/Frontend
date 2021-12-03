import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/body.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/models/user_model.dart';
import 'package:http/http.dart' as http;


Future<User> Login(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:3000/usuarios/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'password' : password,
      'email' : email,
    }),
  );

  

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Error al iniciar sesión.');
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

void GuardarUsuario(String email, String password){
    final User usuario = User(
      id: null,
      username: email,
      password: password,
      email: email,
      imageUrl: 'https://recerca.upc.edu/bampla/en/Personnel/staff_members/Oller-Antoni/2008-01-08.4864239201/@@images/23e43284-a97f-438f-a214-cdf3a87b97b8.jpeg',
    );

    currentUser = usuario;
  }
