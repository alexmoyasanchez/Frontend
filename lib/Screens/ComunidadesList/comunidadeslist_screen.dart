import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ComunidadesList/components/body.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_auth/models/models.dart';

Future<List<Comunidad>> getComunidades() async {
  List<Comunidad> comunidades = [];
  final data = await http.get(Uri.parse('http://147.83.7.157:3000/comunidades/'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    print(data.body);
    Comunidad comunidad  = Comunidad(
        id: u["id"],
        name: u["name"],
        owner: u["owner"],
        idOwner: u["idOwner"],
        usuarios: u["usuarios"],
        descripcion: "",
        imageUrl: "");
    comunidades.add(comunidad);
  }
  print(comunidades.length);
  return comunidades;
}

class ListaComunidadesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          'Lista de Comunidades',
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