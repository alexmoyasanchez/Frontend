import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/NewBar/newbar_screen.dart';
import 'package:flutter_auth/Screens/MisBares/components/body.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_auth/models/bar_model.dart';

Future<List<Bar>> getMisBares() async {
  List<Bar> bares = [];
  final data = await http.get(Uri.parse('http://147.83.7.157:3000/bares/getBaresByUser/' + currentUser.id));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    Bar bar = Bar(
        id: u["id"],
        name: u["name"],
        address: u["address"],
        musicTaste: u["musicTaste"],
        owner: u["owner"],
        idOwner: u["idOwner"],
        aforo: u["aforo"],
        aforoMax: u["aforoMax"],
        horario: u["horario"],
        descripcion: u["descripcion"],
        imageUrl: u["imageUrl"],
        agresion: u["agresion"]);

    bares.add(bar);
  }
  print(bares.length);
  return bares;
}

Future editarBar(String id, String name, String address, String musicTaste,
    String aforo, String aforoMax, String horario, String descripcion) async {
  final data = await http.put(
    Uri.parse('http://147.83.7.157:3000/bares/update/' + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'address': address,
      'musicTaste': musicTaste,
      'aforo': aforo,
      'aforoMax': aforoMax,
      'horario': horario,
      'descripcion': descripcion,
      'imageUrl': "",
    }),
  );

  if (data.statusCode == 201) {
  } else {
    throw Exception('Error al enviar la agresión');
  }
}

Future newPost(String texto, Bar bar) async {
  final data = await http.post(
    Uri.parse('http://147.83.7.157:3000/publicaciones/new'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'idBar': bar.id,
      'nameBar': bar.name,
      'imageBar': bar.imageUrl,
      'texto': texto,
      'imageUrl': null,
      'fecha': DateTime.now().toString(),
      'likes': "0",
    }),
  );

  if (data.statusCode == 201) {
  } else {
    throw Exception('Error al crear post');
  }
}

class MisBaresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          S.current.bares,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NewBarScreen();
                    },
                  ),
                );
              })
        ],
      ),
      body: Body(),
    );
  }
}
