import 'package:flutter/material.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/user_model.dart';
import 'package:flutter_auth/constants.dart';
import 'dart:async';
import 'package:imagebutton/imagebutton.dart';
import 'package:flutter_auth/Screens/UserList/UserList_screen.dart';
import 'package:flutter_auth/Screens/SignUp/components/background.dart';

class Body extends StatelessWidget {
  final Future<User> user;

  Body({Key key, this.user}) : super(key: key);

  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        "data",
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
          child: FutureBuilder(
              future: getUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      int pos = index + 1;
                      if (index == 0) {
                        return Stack(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * .4,
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width / 3 - 80,
                              top: 40,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "2",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomCircleAvatar(
                                    usuario: snapshot.data[1],
                                    size: 100,
                                    image: snapshot.data[1].imageUrl,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width / 3 + 100,
                              top: 40,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "3",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomCircleAvatar(
                                    usuario: snapshot.data[2],
                                    size: 100,
                                    image: snapshot.data[2].imageUrl,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width / 3,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Image.asset(
                                    "assets/images/corona.png",
                                    height: 40,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomCircleAvatar(
                                    usuario: snapshot.data[0],
                                    noGlow: false,
                                    size: 120,
                                    image: snapshot.data[0].imageUrl,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else if (index == 1 || index == 2) {
                        return Container();
                      }
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: PrimaryColor,
                          backgroundImage:
                              NetworkImage(snapshot.data[index].imageUrl),
                        ),
                        title: Text(
                            '$pos' + '. ' + snapshot.data[index].username,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        trailing: Text(
                            S.current.puntuacion2 +
                                snapshot.data[index].puntuacion.toString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
                        subtitle: Text(snapshot.data[index].email,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
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
  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          user.username,
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
              backgroundColor: PrimaryColor,
              backgroundImage: NetworkImage(user.imageUrl),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.username,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              user.username,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.email,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              user.email,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.nombre,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              user.nombre,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.edad,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              user.edad,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.descripcion,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              user.descripcion,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.puntuacion,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              user.puntuacion.toString(),
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

class CustomCircleAvatar extends StatelessWidget {
  final double size;
  final String image;
  final User usuario;
  final bool noGlow;

  const CustomCircleAvatar(
      {Key key, this.size, this.image, this.usuario, this.noGlow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: ImageButton(
            children: <Widget>[],
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => DetailPage(usuario)));
            },
            pressedImage: Image.asset('assets/images/trans.png'),
            unpressedImage: Image.asset('assets/images/trans.png'),
            height: 90,
            width: 90,
          ),
          height: size,
          width: size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              border: Border.all(
                width: noGlow ? 3 : 5,
                color: PrimaryColor,
                //color: Color(0xff17FAC3),
              ),
              boxShadow: noGlow
                  ? []
                  : [
                      BoxShadow(
                        color: PrimaryColor,
                        //color: Color(0xff17FAC3),
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      )
                    ],
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          usuario.username,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          "${usuario.puntuacion}",
          style: TextStyle(
              color: PrimaryColor,
              //color: Color(0xff43A783),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        )
      ],
    );
  }
}
