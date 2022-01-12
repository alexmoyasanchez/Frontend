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
  final data = await http.get(Uri.parse('http://10.0.2.2:3000/publicaciones/'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    print(data.body);
    Post post = Post(
      id: u["id"],
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

Future<void> Like(String idUser, String idPost) async {
  final response = await http.put(
    Uri.parse(
        'http://10.0.2.2:3000/publicaciones/like/' + idUser + '/' + idPost),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{}),
  );

  if (response.statusCode != 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    throw Exception('Error al dar un like.');
  }
}

Future<void> DeshacerLike(String idUser, String idPost) async {
  final response = await http.put(
    Uri.parse('http://10.0.2.2:3000/publicaciones/deshacerLike/' +
        idUser +
        '/' +
        idPost),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{}),
  );

  if (response.statusCode != 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    throw Exception('Error al deshacer un like.');
  }
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
