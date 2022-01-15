import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/BarList/components/body.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/agresion_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_auth/models/bar_model.dart';

Future<Bar> updateBar(
    Bar bar, String motivo, String descripcion, String solucion) async {
  final data = await http.put(
    Uri.parse('http://10.0.2.2:3000/bares/update/' + bar.id),
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
      'agresion': bar.agresion,
      'idUserAgresion': currentUser.id,
      'motivacionAgresion': motivo,
      'descAgresion': descripcion,
      'solAgresion': solucion,
    }),
  );
  print(data.request);
  if (data.statusCode == 201) {
    return Bar.fromJson(jsonDecode(data.body));
  } else {
    throw Exception('Error al editar el bar');
  }
}

Future<Bar> notificarAgresion(Bar bar) async {
  final data = await http.put(
    Uri.parse('http://10.0.2.2:3000/bares/update/' + bar.id),
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
      'idUserAgresion': currentUser.id.toString(),
      'motivacionAgresion': " ",
      'descAgresion': " ",
      'solAgresion': " ",
    }),
  );
  print(data.request);
  if (data.statusCode == 201) {
    return Bar.fromJson(jsonDecode(data.body));
  } else {
    throw Exception('Error al enviar la agresión');
  }
}

Future<List<Bar>> getBares() async {
  List<Bar> bares = [];
  final data = await http.get(Uri.parse('http://10.0.2.2:3000/bares/'));
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
        agresion: u["agresion"],
        idUserAgresion: u["idUserAgresion"],
        motivacionAgresion: u["motivacionAgresion"],
        descAgresion: u["descAgresion"],
        solAgresion: u["solAgresion"],
        latitud: u["latitud"],
        longitud: u["longitud"],
        valoracion: u["valoracion"],
        opinion: u["opinion"]);

    bares.add(bar);
  }
  print(bares.length);
  return bares;
}

Future<Bar> getBar(String id) async {
  final data =
      await http.get(Uri.parse('http://10.0.2.2:3000/bares/getBar/' + id));
  var u = json.decode(data.body);
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
      agresion: u["agresion"],
      idUserAgresion: u["idUserAgresion"],
      motivacionAgresion: u["motivacionAgresion"],
      descAgresion: u["descAgresion"],
      solAgresion: u["solAgresion"],
      latitud: u["latitud"],
      longitud: u["longitud"],
      valoracion: u["valoracion"],
      opinion: u["opinion"]);

  return bar;
}

Future<void> sumarPuntuacion() async {
  final response = await http.put(
    Uri.parse('http://10.0.2.2:3000/usuarios/updatePuntuacion/' +
        currentUser.id +
        '/5'),
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

Future<Bar> enviarOpinion(Bar bar) async {
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
      'valoracion': bar.valoracion,
      'opinion': bar.opinion
    }),
  );
  if (data.statusCode == 201) {
    return Bar.fromJson(jsonDecode(data.body));
  } else {
    throw Exception('Error al enviar tu opinion');
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
