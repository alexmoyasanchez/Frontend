import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/body.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<User> Login(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://147.83.7.157:3000/usuarios/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'password': password,
      'email': email,
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

void GuardarUsuario(String email, String password) {
  final User usuario = User(
    id: null,
    username: email,
    password: password,
    email: email,
    name: null,
    edad: null,
    descripcion: null,
    imageUrl:
        'https://static.elcomercio.es/www/multimedia/202002/20/media/cortadas/gato-kRID-U100219218863XFC-1248x770@El%20Comercio.jpg',
    puntuacion: null,
  );

  currentUser = usuario;
}
