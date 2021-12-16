import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/message_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/models/community_model.dart';
import 'package:flutter_auth/Screens/Chat/components/body.dart';

Future<List<Message>> getMessages() async {
  List<Message> messages = [];
  final data = await http.get(Uri.parse('http://localhost:3000/chat'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    print(data.body);
    Message message = Message(
      sender: u["sender"],
      time: u["time"],
      text: u["text"],
    );
    messages.add(message);
  }
  print(messages.length);
  return messages;
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          'Chat',
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

void EnviarMensaje (String sender, String text) {
  final Message mensage = Message(
    sender: sender,
    text: text
    password: password,
    email: email,
    name: null,
    edad: null,
    descripcion: null,
    imageUrl:
        'https://static.elcomercio.es/www/multimedia/202002/20/media/cortadas/gato-kRID-U100219218863XFC-1248x770@El%20Comercio.jpg',
    puntuacion: null,
  )
