import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/BarList/barlist_screen.dart';
import 'package:flutter_auth/Screens/MisBares/misbares_screen.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field_2.dart';
import 'package:flutter_auth/components/rounded_input_field_description.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/agresion_model.dart';
import 'package:flutter_auth/models/bar_model.dart';
import 'package:flutter_auth/constants.dart';
import 'dart:async';
import 'package:flutter_auth/Screens/SignUp/components/background.dart';
import 'package:imagebutton/imagebutton.dart';

import '../barlist_screen.dart';

class Body extends StatelessWidget {
  final Future<Bar> bar;

  Body({Key key, this.bar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
          child: FutureBuilder(
              future: getBares(),
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
                          backgroundColor: PrimaryColor,
                          backgroundImage:
                              NetworkImage(snapshot.data[index].imageUrl),
                        ),
                        title: Text(
                          snapshot.data[index].name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(snapshot.data[index].address,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
                        trailing: IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {}),
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

class AforoPage extends StatefulWidget {
  final Bar bar;

  AforoPage(this.bar);

  @override
  State<AforoPage> createState() => _AforoPageState();
}

class _AforoPageState extends State<AforoPage> {
  final listItem = [
    '0%',
    '5%',
    '10%',
    '15%',
    '20%',
    '25%',
    '30%',
    '35%',
    '40%',
    '45%',
    '50%',
    '55%',
    '60%',
    '65%',
    '70%',
    '75%',
    '80%',
    '85%',
    '90%',
    '95%',
    '100%'
  ];

  String newValue;
  String aforo;

  @override
  Widget build(BuildContext context) {
    String aforo2 = widget.bar.aforo;

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          S.current.modificaraforo,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            Text(S.current.aforomax + widget.bar.aforoMax + S.current.personas,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            DropdownButton(
                dropdownColor: Colors.black,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                alignment: Alignment.centerRight,
                items: listItem.map(buildMenuItem).toList(),
                hint: Text(S.current.aforo + aforo2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
                value: newValue,
                onChanged: (value) {
                  aforo = value;
                  setState(() {
                    newValue = value;
                  });
                }),
            RoundedButton(
              text: S.current.editara,
              color: Colors.white,
              textColor: Colors.black,
              press: () {
                if (aforo == null) {
                  aforo = aforo2;
                }
                editarBar(
                    widget.bar.id,
                    widget.bar.name,
                    widget.bar.address,
                    widget.bar.musicTaste,
                    '$aforo',
                    widget.bar.aforoMax,
                    widget.bar.horario,
                    widget.bar.descripcion,
                    currentPhoto);
                return Future.delayed(
                    const Duration(milliseconds: 250),
                    () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ListaBaresScreen();
                            },
                          ),
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 20),
        ),
      );
}

class DetailPage extends StatelessWidget {
  final Bar bar;
  DateTime dt = new DateTime(0, 0, 0, 0, 0, 0);

  DetailPage(this.bar);

  @override
  Widget build(BuildContext context) {
    if (bar.agresion != " ") {
      dt = DateTime.parse(bar.agresion);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          bar.name,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        actions: [
          IconButton(
              color: Colors.white,
              icon: Icon(Icons.edit),
              alignment: Alignment.centerRight,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => AforoPage(bar)));
              }),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (bar.idUserAgresion == currentUser.id) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgresionPage(bar)));
                }
                else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgresionDetailPage(bar)));
                }
              },
              child: Text(
                S.current.lastagresion + timeAgo(dt),
                style: TextStyle(
                  backgroundColor: Colors.red[600],
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            CircleAvatar(
              radius: 100.0,
              backgroundColor: PrimaryColor,
              backgroundImage: NetworkImage(bar.imageUrl),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.nombrel,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bar.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.direccion,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bar.address,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.musica,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bar.musicTaste,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.owner,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bar.owner,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.aforo,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bar.aforo,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.aforomax,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bar.aforoMax,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.horario,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bar.horario,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.descripcion2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(bar.descripcion,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
            Divider(
              color: Colors.purple[200],
            ),
            RoundedButton(
              text: S.current.notagresion,
              color: Colors.white,
              textColor: Colors.black,
              press: () async {
                await notificarAgresion(bar);
                getBares();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListaBaresScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AgresionPage extends StatefulWidget {
  final Bar bar;
  AgresionPage(this.bar);

  @override
  State<AgresionPage> createState() => _AgresionPageState();
}

class _AgresionPageState extends State<AgresionPage> {
  String descripcion;

  String solucion;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          S.current.infoagresion,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            Text(S.current.motivo,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: <Widget>[
                    IconButton(
                        iconSize: 80.0,
                        icon: Image.asset(icono1),
                        onPressed: () {
                          if (icono1 == 'assets/images/mujer.png') {
                            icono1 = 'assets/images/mujer_relleno.png';
                            icono2 = 'assets/images/pride.png';
                            icono3 = 'assets/images/black.png';
                            motivo = S.current.machista;
                          } else if (icono1 ==
                              'assets/images/mujer_relleno.png') {
                            icono1 = 'assets/images/mujer.png';
                            motivo = " ";

                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AgresionPage(widget.bar)));
                        }),
                    Text("  " + S.current.machista,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                        iconSize: 80.0,
                        icon: Image.asset(icono2),
                        onPressed: () {
                          if (icono2 == 'assets/images/pride.png') {
                            icono1 = 'assets/images/mujer.png';
                            icono2 = 'assets/images/pride_relleno.png';
                            icono3 = 'assets/images/black.png';
                            motivo = S.current.LGTBIQ;
                          } else if (icono2 ==
                              'assets/images/pride_relleno.png') {
                            icono2 = 'assets/images/pride.png';
                            motivo = " ";
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AgresionPage(widget.bar)));
                        }),
                    Text("  " + S.current.LGTBIQ,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                        iconSize: 80.0,
                        icon: Image.asset(icono3),
                        onPressed: () {
                          if (icono3 == 'assets/images/black.png') {
                            icono1 = 'assets/images/mujer.png';
                            icono2 = 'assets/images/pride.png';
                            icono3 = 'assets/images/black_relleno.png';
                            motivo = S.current.racista;
                          } else if (icono3 ==
                              'assets/images/black_relleno.png') {
                            icono3 = 'assets/images/black.png';
                            motivo = " ";
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AgresionPage(widget.bar)));
                        }),
                    Text("  " + S.current.racista,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedInputFieldLargo(
              hintText: S.current.descripciona + widget.bar.descAgresion,
              onChanged: (value) {
                descripcion = value;
              },
            ),
            RoundedInputFieldLargo(
              hintText: S.current.solucion + widget.bar.solAgresion,
              onChanged: (value) {
                solucion = value;
              },
            ),
            RoundedButton(
              text: S.current.info,
              color: Colors.white,
              textColor: Colors.black,
              press: () {
                updateBar(widget.bar, motivo, descripcion, solucion);
                icono1 = 'assets/images/mujer.png';
                icono2 = 'assets/images/pride.png';
                icono3 = 'assets/images/black.png';
                motivo = " ";
                return Future.delayed(
                    const Duration(milliseconds: 250),
                    () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailPage(widget.bar);
                            },
                          ),
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AgresionDetailPage extends StatelessWidget {
  final Bar bar;
  DateTime dt = new DateTime(0, 0, 0, 0, 0, 0);

  AgresionDetailPage(this.bar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          S.current.agresion,
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
            Divider(
              color: Colors.black,
            ),
            Text(
              S.current.motivo,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bar.motivacionAgresion,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Colors.purple[200],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              S.current.descripciona,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bar.descAgresion,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Colors.purple[200],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              S.current.solucion,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bar.solAgresion,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String timeAgo(DateTime d) {
  if (d != DateTime(0, 0, 0, 0, 0, 0)) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365)
      return S.current.hace +
          "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? S.current.year : S.current.years} " +
          S.current.atras;
    if (diff.inDays > 30)
      return S.current.hace +
          "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? S.current.mes : S.current.meses} " +
          S.current.atras;
    if (diff.inDays > 7)
      return S.current.hace +
          "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? S.current.semana : S.current.semanas} " +
          S.current.atras;
    if (diff.inDays > 0)
      return S.current.hace +
          "${diff.inDays} ${diff.inDays == 1 ? S.current.dia : S.current.dias} " +
          S.current.atras;
    if (diff.inHours > 0)
      return S.current.hace +
          "${diff.inHours} ${diff.inHours == 1 ? S.current.hora : S.current.horas} " +
          S.current.atras;
    if (diff.inMinutes > 0)
      return S.current.hace +
          "${diff.inMinutes} ${diff.inMinutes == 1 ? S.current.minuto : S.current.minutos} " +
          S.current.atras;
    return S.current.ahora;
  }

  return S.current.noagresion;
}
