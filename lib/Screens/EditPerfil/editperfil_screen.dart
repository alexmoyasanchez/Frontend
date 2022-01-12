import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/EditPerfil/components/body.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<User> editarUser(String username, String password, String email,
    String nombre, String edad, String descripcion) async {
  final response = await http.put(
    Uri.parse('http://147.83.7.157:3000/usuarios/update/' + currentUser.id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
      'email': email,
      'nombre': nombre,
      'edad': edad,
      'descripcion': descripcion,
      'imageUrl': "",
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Error al editar usuario.');
  }
}

class EditPerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
