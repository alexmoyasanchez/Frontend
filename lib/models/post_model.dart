import 'package:flutter/material.dart';

class Post {
  final String nameBar;
  final String idBar;
  final String imageBar;
  final String texto;
  final String fecha;
  final String imageUrl;
  final int likes;

  const Post({
    @required this.nameBar,
    this.idBar,
    @required this.imageBar,
    @required this.texto,
    @required this.fecha,
    this.imageUrl,
    @required this.likes
  });
}