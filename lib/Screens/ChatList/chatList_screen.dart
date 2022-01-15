import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ChatList/components/body.dart';
import 'package:flutter_auth/Screens/NewComunidad/newcomunidad_screen.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_auth/models/models.dart';

Future<List<Comunidad>> getComunidadesById() async {
  List<Comunidad> comunidades = [];
  final data = await http.get(Uri.parse('http://10.0.2.2:3000/comunidades/'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    print(data.body);
    Comunidad comunidad = Comunidad(
        id: u["id"],
        name: u["name"],
        owner: u["owner"],
        idOwner: u["idOwner"],
        usuarios: u["usuarios"],
        descripcion: u["descripcion"],
        imageUrl: u["imageUrl"]);
    comunidades.add(comunidad);
  }
  print(comunidades.length);
  return comunidades;
}

Future updateComunidad(String idComunidad, String name, String descripcion,
    String imageUrl) async {
  final data = await http.put(
    Uri.parse('http://10.0.2.2:3000/comunidades/update/' + idComunidad),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'descripcion': descripcion,
      'imageUrl': imageUrl,
    }),
  );
  if (data.statusCode == 201) {
    return ListaChatsScreen();
  } else {
    throw Exception('Error al unirse a la comunidad');
  }
}

Future deleteComunidad(String idComunidad) async {
  final data = await http.delete(
      Uri.parse('http://10.0.2.2:3000/comunidades/delete/' + idComunidad));

  if (data.statusCode == 201) {
    return ListaChatsScreen();
  } else {
    throw Exception('Error al unirse a la comunidad');
  }
}

class ListaChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          S.current.listac,
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
