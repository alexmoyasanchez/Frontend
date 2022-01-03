import 'package:flutter/material.dart';


class Agresion{
  final String id;
  final String idBar;
  final String idUser;
  final String motivacion;
  final String descripcion;
  final String solucion;
  final String fecha;

  const Agresion({
    @required this.id,
    @required this.idBar,
    @required this.idUser,
    @required this.motivacion,
    @required this.descripcion,
    @required this.solucion,
    @required this.fecha
    
  });

  factory Agresion.fromJson(Map<String, dynamic> json) {
    return Agresion(
      id: json['id'],
      idBar: json['idBar'],      
      idUser: json['idUser'],
      motivacion: json['motivacion'],
      descripcion: json['descripcion'],
      solucion: json['solucion'],
      fecha: json['fecha']
    );
  }
}