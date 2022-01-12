import 'package:flutter/material.dart';
import 'models.dart';


class Estadistica{
  final String numUsuarios;
  final String numBares;
  final String numComunidades;

  const Estadistica({
    @required this.numUsuarios,
    @required this.numBares,
    @required this.numComunidades
  });

  factory Estadistica.fromJson(Map<String, dynamic> json) {
    return Estadistica(
      numUsuarios: json['numUsuarios'],
      numBares: json['numBares'],      
      numComunidades: json['numComunidades'],
    );
  }
}