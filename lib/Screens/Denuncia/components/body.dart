import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Feed/feed_screen.dart';
import 'package:flutter_auth/Screens/MisComunidades/miscomunidades_screen.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:flutter_auth/constants.dart';
import 'dart:async';
import 'package:flutter_auth/Screens/Denuncia/denuncia_screen.dart';
import 'package:flutter_auth/Screens/SignUp/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 200.0,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: new Text(S.current.mensajedenuncia),
                      actions: <Widget>[
                        new FlatButton(
                            child: new Text(S.current.close),
                            onPressed: () {
                              Denunciar(currentUser.id, idDenuncia, S.current.desc1);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FeedScreen();
                              }));
                            })
                      ],
                    );
                  },
                );
              },
              child: Text(
                S.current.desc1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: new Text(S.current.mensajedenuncia),
                      actions: <Widget>[
                        new FlatButton(
                            child: new Text(S.current.close),
                            onPressed: () {
                              Denunciar(currentUser.id, idDenuncia, S.current.desc2);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FeedScreen();
                              }));
                            })
                      ],
                    );
                  },
                );
              },
              child: Text(
                S.current.desc2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: new Text(S.current.mensajedenuncia),
                      actions: <Widget>[
                        new FlatButton(
                            child: new Text(S.current.close),
                            onPressed: () {
                              Denunciar(currentUser.id, idDenuncia, S.current.desc3);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FeedScreen();
                              }));
                            })
                      ],
                    );
                  },
                );
              },
              child: Text(
                S.current.desc3,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: new Text(S.current.mensajedenuncia),
                      actions: <Widget>[
                        new FlatButton(
                            child: new Text(S.current.close),
                            onPressed: () {
                              Denunciar(currentUser.id, idDenuncia, S.current.desc4);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FeedScreen();
                              }));
                            })
                      ],
                    );
                  },
                );
              },
              child: Text(
                S.current.desc4,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
          ],
        ),
      ),
    );
  }
}
