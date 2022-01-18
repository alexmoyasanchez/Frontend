import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/NewBar/components/body.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_auth/models/bar_model.dart';

Future createBar(
    String name,
    String direccion,
    String musicTaste,
    String aforoMax,
    String horario,
    String descripcion,
    String imageUrl,
    String latitud,
    String longitud) async {
  print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
  print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
  print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
  print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
  print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
  print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
  print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
  print(name);
  print(direccion);
  print(musicTaste);
  print(aforoMax);
  print(horario);
  print(descripcion);
  print(currentPhoto);
  print(latitud);
  print(longitud);
  final response = await http.post(
    Uri.parse('http://localhost:3000/bares/new'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'address': direccion,
      'musicTaste': musicTaste,
      'owner': currentUser.nombre,
      'idOwner': currentUser.id,
      'aforo': "0",
      'aforoMax': aforoMax,
      'horario': horario,
      'descripcion': descripcion,
      'imageUrl': imageUrl,
      'idAgresion': ' ',
      'latitud': latitud,
      'longitud': longitud,
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

class NewBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          S.current.nuevol,
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
