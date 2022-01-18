//import 'dart:ffi';

import 'package:flutter/material.dart';

class Post {
  final String id;
  final String nameBar;
  final String idBar;
  final String imageBar;
  final String texto;
  final String fecha;
  final String imageUrl;
  final List<dynamic> likes;

  const Post({
    @required this.id,
    @required this.nameBar,
    this.idBar,
    @required this.imageBar,
    @required this.texto,
    @required this.fecha,
    this.imageUrl,
    @required this.likes
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      nameBar: json['nameBar'],      
      idBar: json['idBar'],
      imageBar: json['imageBar'],
      texto: json['texto'],
      fecha: json['fecha'],
      imageUrl: json['imageUrl'],
      likes: json['likes']
    );
  }
}