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
                      child: Center(child: CircularProgressIndicator(color: Colors.white)));
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
                        title: Text(snapshot.data[index].username,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        trailing: Text('$pos',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
                        subtitle: Text(
                            S.current.puntuacion2 +
                                snapshot.data[index].puntuacion.toString(),
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
  String insignia1;
  String insignia2;
  String insignia3;
  String insignia4;
  String insignia5;
  String insignia6;
  String insignia7;
  String insignia8;
  String insignia9;
  String insignia10;
  String insignia11;
  String insignia12;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    if (user.puntuacion < 25 && user.puntuacion >= 0) {
      insignia1 = 'assets/images/insignia1_desactivada.png';
      insignia2 = 'assets/images/insignia2_desactivada.png';
      insignia3 = 'assets/images/insignia3_desactivada.png';
      insignia4 = 'assets/images/insignia4_desactivada.png';
      insignia5 = 'assets/images/insignia5_desactivada.png';
      insignia6 = 'assets/images/insignia6_desactivada.png';
      insignia7 = 'assets/images/insignia7_desactivada.png';
      insignia8 = 'assets/images/insignia8_desactivada.png';
      insignia9 = 'assets/images/insignia9_desactivada.png';
      insignia10 = 'assets/images/insignia10_desactivada.png';
      insignia11 = 'assets/images/insignia11_desactivada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else if (user.puntuacion < 50 && user.puntuacion >= 25) {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_desactivada.png';
      insignia3 = 'assets/images/insignia3_desactivada.png';
      insignia4 = 'assets/images/insignia4_desactivada.png';
      insignia5 = 'assets/images/insignia5_desactivada.png';
      insignia6 = 'assets/images/insignia6_desactivada.png';
      insignia7 = 'assets/images/insignia7_desactivada.png';
      insignia8 = 'assets/images/insignia8_desactivada.png';
      insignia9 = 'assets/images/insignia9_desactivada.png';
      insignia10 = 'assets/images/insignia10_desactivada.png';
      insignia11 = 'assets/images/insignia11_desactivada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else if (user.puntuacion < 75 && user.puntuacion >= 50) {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_activada.png';
      insignia3 = 'assets/images/insignia3_desactivada.png';
      insignia4 = 'assets/images/insignia4_desactivada.png';
      insignia5 = 'assets/images/insignia5_desactivada.png';
      insignia6 = 'assets/images/insignia6_desactivada.png';
      insignia7 = 'assets/images/insignia7_desactivada.png';
      insignia8 = 'assets/images/insignia8_desactivada.png';
      insignia9 = 'assets/images/insignia9_desactivada.png';
      insignia10 = 'assets/images/insignia10_desactivada.png';
      insignia11 = 'assets/images/insignia11_desactivada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else if (user.puntuacion < 100 && user.puntuacion >= 75) {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_activada.png';
      insignia3 = 'assets/images/insignia3_activada.png';
      insignia4 = 'assets/images/insignia4_desactivada.png';
      insignia5 = 'assets/images/insignia5_desactivada.png';
      insignia6 = 'assets/images/insignia6_desactivada.png';
      insignia7 = 'assets/images/insignia7_desactivada.png';
      insignia8 = 'assets/images/insignia8_desactivada.png';
      insignia9 = 'assets/images/insignia9_desactivada.png';
      insignia10 = 'assets/images/insignia10_desactivada.png';
      insignia11 = 'assets/images/insignia11_desactivada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else if (user.puntuacion < 150 && user.puntuacion >= 100) {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_activada.png';
      insignia3 = 'assets/images/insignia3_activada.png';
      insignia4 = 'assets/images/insignia4_activada.png';
      insignia5 = 'assets/images/insignia5_desactivada.png';
      insignia6 = 'assets/images/insignia6_desactivada.png';
      insignia7 = 'assets/images/insignia7_desactivada.png';
      insignia8 = 'assets/images/insignia8_desactivada.png';
      insignia9 = 'assets/images/insignia9_desactivada.png';
      insignia10 = 'assets/images/insignia10_desactivada.png';
      insignia11 = 'assets/images/insignia11_desactivada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else if (user.puntuacion < 200 && user.puntuacion >= 150) {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_activada.png';
      insignia3 = 'assets/images/insignia3_activada.png';
      insignia4 = 'assets/images/insignia4_activada.png';
      insignia5 = 'assets/images/insignia5_activada.png';
      insignia6 = 'assets/images/insignia6_desactivada.png';
      insignia7 = 'assets/images/insignia7_desactivada.png';
      insignia8 = 'assets/images/insignia8_desactivada.png';
      insignia9 = 'assets/images/insignia9_desactivada.png';
      insignia10 = 'assets/images/insignia10_desactivada.png';
      insignia11 = 'assets/images/insignia11_desactivada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else if (user.puntuacion < 250 && user.puntuacion >= 200) {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_activada.png';
      insignia3 = 'assets/images/insignia3_activada.png';
      insignia4 = 'assets/images/insignia4_activada.png';
      insignia5 = 'assets/images/insignia5_activada.png';
      insignia6 = 'assets/images/insignia6_activada.png';
      insignia7 = 'assets/images/insignia7_desactivada.png';
      insignia8 = 'assets/images/insignia8_desactivada.png';
      insignia9 = 'assets/images/insignia9_desactivada.png';
      insignia10 = 'assets/images/insignia10_desactivada.png';
      insignia11 = 'assets/images/insignia11_desactivada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else if (user.puntuacion < 300 && user.puntuacion >= 250) {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_activada.png';
      insignia3 = 'assets/images/insignia3_activada.png';
      insignia4 = 'assets/images/insignia4_activada.png';
      insignia5 = 'assets/images/insignia5_activada.png';
      insignia6 = 'assets/images/insignia6_activada.png';
      insignia7 = 'assets/images/insignia7_activada.png';
      insignia8 = 'assets/images/insignia8_desactivada.png';
      insignia9 = 'assets/images/insignia9_desactivada.png';
      insignia10 = 'assets/images/insignia10_desactivada.png';
      insignia11 = 'assets/images/insignia11_desactivada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else if (user.puntuacion < 350 && user.puntuacion >= 300) {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_activada.png';
      insignia3 = 'assets/images/insignia3_activada.png';
      insignia4 = 'assets/images/insignia4_activada.png';
      insignia5 = 'assets/images/insignia5_activada.png';
      insignia6 = 'assets/images/insignia6_activada.png';
      insignia7 = 'assets/images/insignia7_activada.png';
      insignia8 = 'assets/images/insignia8_activada.png';
      insignia9 = 'assets/images/insignia9_desactivada.png';
      insignia10 = 'assets/images/insignia10_desactivada.png';
      insignia11 = 'assets/images/insignia11_desactivada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else if (user.puntuacion < 400 && user.puntuacion >= 350) {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_activada.png';
      insignia3 = 'assets/images/insignia3_activada.png';
      insignia4 = 'assets/images/insignia4_activada.png';
      insignia5 = 'assets/images/insignia5_activada.png';
      insignia6 = 'assets/images/insignia6_activada.png';
      insignia7 = 'assets/images/insignia7_activada.png';
      insignia8 = 'assets/images/insignia8_activada.png';
      insignia9 = 'assets/images/insignia9_activada.png';
      insignia10 = 'assets/images/insignia10_desactivada.png';
      insignia11 = 'assets/images/insignia11_desactivada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else if (user.puntuacion < 500 && user.puntuacion >= 400) {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_activada.png';
      insignia3 = 'assets/images/insignia3_activada.png';
      insignia4 = 'assets/images/insignia4_activada.png';
      insignia5 = 'assets/images/insignia5_activada.png';
      insignia6 = 'assets/images/insignia6_activada.png';
      insignia7 = 'assets/images/insignia7_activada.png';
      insignia8 = 'assets/images/insignia8_activada.png';
      insignia9 = 'assets/images/insignia9_activada.png';
      insignia10 = 'assets/images/insignia10_activada.png';
      insignia11 = 'assets/images/insignia11_desactivada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else if (user.puntuacion < 1000 && user.puntuacion >= 500) {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_activada.png';
      insignia3 = 'assets/images/insignia3_activada.png';
      insignia4 = 'assets/images/insignia4_activada.png';
      insignia5 = 'assets/images/insignia5_activada.png';
      insignia6 = 'assets/images/insignia6_activada.png';
      insignia7 = 'assets/images/insignia7_activada.png';
      insignia8 = 'assets/images/insignia8_activada.png';
      insignia9 = 'assets/images/insignia9_activada.png';
      insignia10 = 'assets/images/insignia10_activada.png';
      insignia11 = 'assets/images/insignia11_activada.png';
      insignia12 = 'assets/images/insignia12_desactivada.png';
    } else {
      insignia1 = 'assets/images/insignia1_activada.png';
      insignia2 = 'assets/images/insignia2_activada.png';
      insignia3 = 'assets/images/insignia3_activada.png';
      insignia4 = 'assets/images/insignia4_activada.png';
      insignia5 = 'assets/images/insignia5_activada.png';
      insignia6 = 'assets/images/insignia6_activada.png';
      insignia7 = 'assets/images/insignia7_activada.png';
      insignia8 = 'assets/images/insignia8_activada.png';
      insignia9 = 'assets/images/insignia9_activada.png';
      insignia10 = 'assets/images/insignia10_activada.png';
      insignia11 = 'assets/images/insignia11_activada.png';
      insignia12 = 'assets/images/insignia12_activada.png';
    }
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
            Divider(
              color: Colors.black,
              height: 20.0,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia1),
                ),
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia2),
                ),
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia3),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              height: 10.0,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia4),
                ),
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia5),
                ),
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia6),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              height: 10.0,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia7),
                ),
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia8),
                ),
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia9),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              height: 10.0,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia10),
                ),
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia11),
                ),
                CircleAvatar(
                  radius: 58.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(insignia12),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              height: 10.0,
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
