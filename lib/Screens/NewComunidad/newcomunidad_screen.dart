import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/NewComunidad/components/body.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future createComunidad(String name, String descripcion, String imageUrl) async {
  final response = await http.post(
    Uri.parse('http://147.83.7.157:3000/comunidades/new'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'owner': currentUser.nombre,
      'idOwner': currentUser.id,
      'descripcion': descripcion,
      'imageUrl': imageUrl,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception(S.current.wrongu);
  }
}

void GuardarFotoBar(String imageUrl) async {
  final User usuario = User(
    id: currentUser.id,
    username: currentUser.username,
    password: currentUser.password,
    email: currentUser.email,
    nombre: '',
    edad: '',
    descripcion: '',
    imageUrl: imageUrl,
    puntuacion: currentUser.puntuacion,
  );
  currentUser = usuario;
}

Future<void> sumarPuntuacionCrear() async {
  final response = await http.put(
    Uri.parse('http://147.83.7.157:3000/usuarios/updatePuntuacion/' +
        currentUser.id +
        '/10'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{}),
  );

  if (response.statusCode != 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    throw Exception('Error al actualizar la puntuación.');
  }
}

class NewComunidadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          S.current.nuevac,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
