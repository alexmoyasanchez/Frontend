import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Chat/Chat_screen.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/models/bar_model.dart';
import 'package:flutter_auth/constants.dart';
import 'dart:async';
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
    return Background(
      child: Center(
          child: FutureBuilder(
              future: getCommunitys(),
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
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data[index].imageUrl),
                        ),
                        title: Text(snapshot.data[index].name,
                            style: TextStyle(
                                color: Colors.pink[800],
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            'Grupo creado por: ' + snapshot.data[index].owner,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChatScreen(
                              user: User(
                                  id: '1',
                                  username: "oscar08850",
                                  password: "45654",
                                  email: "asdfa@gmail.com",
                                  name: "oscar",
                                  edad: "24",
                                  descripcion: "holahola",
                                  imageUrl: currentUser.imageUrl,
                                  puntuacion: "4"),
                            );
                          }));
                        },
                      );
                    },
                  );
                }
              })),
    );
  }
}
