import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Estadisticas/components/body.dart';
import 'package:flutter_auth/Screens/NewComunidad/newcomunidad_screen.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_auth/models/models.dart';

Future<List<Estadistica>> getEstadisticas() async {
  List<Estadistica> estadisticas = [];
  final data = await http.get(Uri.parse('http://147.83.7.157:3000/estadisticas/'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    Estadistica estadistica = Estadistica(
        numUsuarios: u["numUsuarios"],
        numBares: u["numBares"],
        numComunidades: u["numComunidades"]);
    estadisticas.add(estadistica);
  }
  return estadisticas;
}

class EstadisticasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          S.current.estadisticas,
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
