import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Busqueda/components/body.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<User> buscarUsuario(String username) async {
  User user;
  final data = await http.get(Uri.parse(
      'http://localhost:3000/usuarios/getUsuarioByUsername/' + username));
  var jsonData = json.decode(data.body);

  user = User(
    id: jsonData["id"],
    username: jsonData["username"],
    password: jsonData["password"],
    email: jsonData["email"],
    nombre: jsonData["nombre"],
    edad: jsonData["edad"],
    descripcion: jsonData["descripcion"],
    imageUrl: jsonData["imageUrl"],
    puntuacion: jsonData["puntuacion"],
  );
  if (data.statusCode == 200) {
    return user;
  } else {
    throw Exception('Error al buscar el usuario');
  }
}

Future<Comunidad> buscarComunidad(String name) async {
  List<Comunidad> comunidades = [];
  Comunidad comunidad;
  final data = await http.get(Uri.parse(
      'http://localhost:3000/comunidades/getComunidadByName/' + name));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    comunidad = Comunidad(
        id: u["id"],
        name: u["name"],
        owner: u["owner"],
        idOwner: u["idOwner"],
        usuarios: u["usuarios"],
        descripcion: u["descripcion"],
        imageUrl: u["imageUrl"]);

    comunidades.add(comunidad);
  }
  if (data.statusCode == 200) {
    return comunidad;
  } else {
    throw Exception('Error al buscar la comunidad');
  }
}

Future<List<Bar>> buscarBar(String name) async {
  List<Bar> bares = [];
  Bar bar;
  final data = await http
      .get(Uri.parse('http://localhost:3000/bares/getBarByName/' + name));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    bar = Bar(
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
        solAgresion: u["solAgresion"]);

    bares.add(bar);
  }

  if (data.statusCode == 200) {
    return bares;
  } else {
    throw Exception('Error al buscar el bar');
  }
}

class BusquedaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
