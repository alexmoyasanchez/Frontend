import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/BarList/components/body.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
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
        aforo: "",
        aforoMax: "",
        horario: "",
        descripcion: "",
        imageUrl: "");
    bares.add(bar);
  }
  print(bares.length);
  return bares;
}

class ListaBaresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          'Lista de Bares',
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
