import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Chat/Chat_screen.dart';
import 'package:flutter_auth/Screens/ChatList/ChatList_screen.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:flutter_auth/constants.dart';
import 'dart:async';
import 'package:flutter_auth/Screens/SignUp/components/background.dart';

class Body extends StatelessWidget {
  final Future<Comunidad> comunidad;

  Body({Key key, this.comunidad}) : super(key: key);

  String name;
  String descripcion;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
        child: FutureBuilder(
            future: getComunidadesById(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.data == null) {
                return Container(
                    child: Center(child: CircularProgressIndicator(color: Colors.white)));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: PrimaryColor,
                        backgroundImage:
                            NetworkImage(snapshot.data[index].imageUrl),
                      ),
                      title: Text(snapshot.data[index].name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(snapshot.data[index].owner,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(room: snapshot.data[index])));
                      },
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
