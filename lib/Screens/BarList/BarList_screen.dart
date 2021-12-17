import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/BarList/components/body.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_auth/models/bar_model.dart';

Future<List<Bar>> getBares() async {
  List<Bar> bares = [];
  final data = await http.get(Uri.parse('http://147.83.7.157:3000/bares/'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    print(data.body);
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

Future<Bar> enviarAgresion(Bar bar) async {
  final data = await http.put(
    Uri.parse('http://147.83.7.157:3000/bares/update/' + bar.id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': bar.id,
      'name': bar.name,
      'address': bar.address,
      'musicTaste': bar.musicTaste,
      'owner': bar.owner,
      'idOwner': bar.idOwner,
      'aforo': bar.aforo,
      'aforoMax': bar.aforoMax,
      'horario': bar.horario,
      'descripcion': bar.descripcion,
      'imageUrl': bar.imageUrl,
      'agresion': DateTime.now().toString(),
    }),
  );

  if (data.statusCode == 201) {
    return Bar.fromJson(jsonDecode(data.body));
  } else {
    throw Exception('Error al enviar la agresión');
  }
}

class ListaBaresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          S.current.listabares,
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
