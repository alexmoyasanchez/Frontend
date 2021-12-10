import 'package:flutter/material.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:flutter_auth/constants.dart';
import 'dart:async';
import 'package:flutter_auth/Screens/ComunidadesList/comunidadeslist_screen.dart';
import 'package:flutter_auth/Screens/UserList/components/background.dart';

class Body extends StatelessWidget {
  final Future<Comunidad> comunidad;

  Body({Key key, this.comunidad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
          child: FutureBuilder(
              future: getComunidades(),
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
                        subtitle: Text(snapshot.data[index].owner,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                      );
                    },
                  );
                }
              })),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Comunidad comunidad;

  DetailPage(this.comunidad);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          comunidad.name,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            CircleAvatar(
              radius: 100.0,
              backgroundImage: NetworkImage(comunidad.imageUrl),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              "Nombre de la comunidad",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              comunidad.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              "Creador",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              comunidad.owner,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            /*Text(
              "Número de usuarios en la comunidad",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              comunidad.usuarios.length.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),*/
            Divider(
              color: Colors.purple[200],
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              "Descripcion",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            
            Text(
              comunidad.descripcion,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}