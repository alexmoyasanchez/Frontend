import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ComunidadesList/components/body.dart';
import 'package:flutter_auth/Screens/NewComunidad/newcomunidad_screen.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_auth/models/models.dart';

Future<List<Comunidad>> getComunidades() async {
  List<Comunidad> comunidades = [];
  final data =
      await http.get(Uri.parse('http://10.0.2.2:3000/comunidades/'));
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

Future unirComunidad(String idComunidad) async {
  final data = await http.put(Uri.parse(
      'http://10.0.2.2:3000/comunidades/addUsuario/' +
          currentUser.id +
          '/comunidad/' +
          idComunidad));
  if (data.statusCode == 201) {
    final data = await http.put(Uri.parse(
        'http://10.0.2.2:3000/comunidades/addUsuario/' +
            currentUser.id +
            '/comunidad/' +
            idComunidad));
    if (data.statusCode == 201) {
      return ListaComunidadesScreen();
    } else {
      throw Exception('Error al unirse a la comunidad');
    }
  }
}

Future<void> sumarPuntuacion () async{
  final response = await http.put(
    Uri.parse(
        'http://10.0.2.2:3000/usuarios/updatePuntuacion/' + currentUser.id + '/2'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{}),
  );

  if (response.statusCode != 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    throw Exception('Error al dar un like.');
  }
}


class ListaComunidadesScreen extends StatelessWidget {
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
