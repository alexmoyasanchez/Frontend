import 'package:flutter/material.dart';
import 'models.dart';


class Comunidad{
  final String id;
  final String name;
  final String owner;
  final String idOwner;
  final List<User> usuarios;
  final String descripcion;
  final String imageUrl;

  const Comunidad({
    @required this.id,
    @required this.name,
    @required this.owner,
    @required this.idOwner,
    @required this.usuarios,
    @required this.descripcion,
    @required this.imageUrl
    
  });

  factory Comunidad.fromJson(Map<String, dynamic> json) {
    return Comunidad(
      id: json['id'],
      name: json['name'],      
      owner: json['owner'],
      idOwner: json['idOwner'],
      usuarios: json['usuarios'],
      descripcion: json['descripcion'],
      imageUrl: json['imageUrl'],
    );
  }
}