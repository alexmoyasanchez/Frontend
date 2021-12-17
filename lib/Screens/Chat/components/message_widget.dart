import 'dart:html';
import 'package:flutter_auth/Screens/Chat/chat_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/data/data.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const TextWidget({Key key, this.text, this.onChanged, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = "";
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('Hm');
    String formatted = formatter.format(now);
    String name = currentUser.name;
    return Container(
      height: 70.0,
      color: Colors.white,
      alignment: FractionalOffset.bottomCenter,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Colors.blueAccent,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                text = value;
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Colors.blueAccent,
            onPressed: () {
              EnviarMensaje(name, text, formatted);
            },
          ),
        ],
      ),
    );
  }
}
