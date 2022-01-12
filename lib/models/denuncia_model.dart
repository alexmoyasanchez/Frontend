import 'package:flutter/material.dart';
import 'models.dart';


class Denuncia{
  final String id;
  final String idUsuario;
  final String idPublicacion;
  final String descripcion;

  const Denuncia({
    @required this.id,
    @required this.idUsuario,
    @required this.idPublicacion,
    @required this.descripcion
    
  });

  factory Denuncia.fromJson(Map<String, dynamic> json) {
    return Denuncia(
      id: json['id'],
      idUsuario: json['idUsuario'],      
      idPublicacion: json['idPublicacion'],
      descripcion: json['descripcion'],
    );
  }
}