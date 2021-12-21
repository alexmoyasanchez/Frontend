import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Chat/Chat_screen.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/models/bar_model.dart';
import 'package:flutter_auth/constants.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter_auth/Screens/ChatList/chatList_screen.dart';
import 'package:flutter_auth/Screens/BarList/BarList_screen.dart';
import 'package:flutter_auth/Screens/UserList/components/background.dart';
import 'package:flutter_auth/models/community_model.dart';
import 'package:flutter_auth/models/models.dart';

class Body extends StatelessWidget {
  final Future<Community> community;

  Body({Key key, this.community}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = "";
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('Hm');
    String formatted = formatter.format(now);
    String name = currentUser.username;
    return Background(
        child: Center(
            child: FutureBuilder(
                future: getMessages(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot.data);
                  if (snapshot.data == null) {
                    return Container(
                        child: Center(child: CircularProgressIndicator()));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data[index].text,
                              style: TextStyle(
                                  color: Colors.pink[800],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              'Enviado por: ' +
                                  snapshot.data[index].sender +
                                  ' a las ' +
                                  snapshot.data[index].time,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        );
                      },
                    );
                  }
                })));
  }
}

_buildMessageComposer() {
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

_showMessages() {
  Widget build(BuildContext context) {
    child:
    Center(
        child: FutureBuilder(
            future: getMessages(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.data == null) {
                return Container(
                    child: Center(child: CircularProgressIndicator()));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data[index].text,
                          style: TextStyle(
                              color: Colors.pink[800],
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          'Enviado por: ' +
                              snapshot.data[index].sender +
                              ' a las  ' +
                              snapshot.data[index].time,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    );
                  },
                );
              }
            }));
  }
}
