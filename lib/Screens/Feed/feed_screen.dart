import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Feed/components/body.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List<Post>> getPosts() async {
  List<Post> posts = [];
  final data = await http.get(Uri.parse('http://147.83.7.157:3000/publicaciones/'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    print(data.body);
    Post post = Post(
      idBar: u["idBar"],
      nameBar: u["nameBar"],
      imageBar: u["imageBar"],
      texto: u["texto"],
      imageUrl: u["imageUrl"],
      fecha: u["fecha"],
      likes: u["likes"],
    );
    posts.add(post);
  }
  print(posts.length);
  posts.sort((b, a) => a.fecha.compareTo(b.fecha));
  return posts;
}

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Image.asset(
          "assets/images/logo_verde.png",
          width: 55,
          height: 55,
          fit: BoxFit.cover,
        ),
        /*title: Text(
          'Barea',
          style: const TextStyle(
            color: Color(0xFFC6FF00),
            fontSize: 28.0, 
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2
          ),
        ),*/
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
