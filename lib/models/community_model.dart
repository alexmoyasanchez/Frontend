import 'package:flutter/material.dart';
import 'models.dart';

class Community {
  final String id;
  final String name;
  final String owner;
  final String idOwner;
  final List<String> users;
  final String descripcion;
  final String imageUrl;

  const Community(
      {@required this.id,
      @required this.name,
      @required this.owner,
      @required this.idOwner,
      this.users,
      @required this.descripcion,
      @required this.imageUrl});

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      id: json['id'],
      name: json['name'],
      owner: json['owner'],
      idOwner: json['idOwner'],
      users: json['users'],
      descripcion: json['descripcion'],
      imageUrl: json['imageUrl'],
    );
  }
}
