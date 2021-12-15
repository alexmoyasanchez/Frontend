import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/models/community_model.dart';
import 'package:flutter_auth/Screens/ChatList/components/body.dart';

Future<List<Community>> getCommunitys() async {
  List<Community> communitys = [];
  final data =
      await http.get(Uri.parse('http://147.83.7.157:3000/comunidades/'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    print(data.body);
    Community community = Community(
        id: u["id"],
        name: u["name"],
        owner: u["owner"],
        idOwner: u["idOwner"],
        descripcion: "",
        imageUrl: "");
    communitys.add(community);
  }
  print(communitys.length);
  return communitys;
}

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          'Chats',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
