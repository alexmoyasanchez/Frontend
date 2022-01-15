import 'package:flutter/material.dart';

class Valoracion {
  final String id;
  final String idBar;
  final String idUsuario;
  final String puntos;
  final String descripcion;

  Valoracion(
      {@required this.id,
      @required this.idBar,
      @required this.idUsuario,
      @required this.puntos,
      @required this.descripcion});

  factory Valoracion.fromJson(Map<String, dynamic> json) {
    return Valoracion(
        id: json['id'],
        idBar: json['name'],
        idUsuario: json['address'],
        puntos: json['musicTaste'],
        descripcion: json['descripcion']);
  }
}