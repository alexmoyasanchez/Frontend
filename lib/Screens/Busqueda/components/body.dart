import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/components/rounded_input_field_2.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/bar_model.dart';
import 'package:flutter_auth/constants.dart';
import 'dart:async';
import 'package:flutter_auth/Screens/Busqueda/busqueda_screen.dart';

class Body extends StatelessWidget {
  final Future<Bar> bar;

  String busqueda;

  Body({Key key, this.bar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          S.current.buscar,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        Row(children: [
          RoundedInputField2(
            hintText: S.current.buscar,
            onChanged: (value) {
              busqueda = value;
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              if (buscaBar == true) {
                bbar = busqueda;
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => BarPage()));
              } else if (buscaComunidad == true) {
                bcomunidad = busqueda;
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => ComunidadPage()));
              } else if (buscaUsuario == true) {
                busuario = busqueda;
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => UsuarioPage()));
              }
            },
          )
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              iconSize: 50.0,
              icon: Image.asset(icono5),
              onPressed: () {
                if (icono5 == 'assets/images/usuario.png') {
                  icono5 = 'assets/images/usuario_relleno.png';
                  icono6 = 'assets/images/comunidad.png';
                  icono7 = 'assets/images/bar.png';

                  buscaUsuario = true;
                  buscaBar = false;
                  buscaComunidad = false;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BusquedaScreen()));
                }
              },
            ),
            IconButton(
              iconSize: 50.0,
              icon: Image.asset(icono6),
              onPressed: () {
                if (icono6 == 'assets/images/comunidad.png') {
                  icono5 = 'assets/images/usuario.png';
                  icono6 = 'assets/images/comunidad_relleno.png';
                  icono7 = 'assets/images/bar.png';

                  buscaUsuario = false;
                  buscaBar = false;
                  buscaComunidad = true;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BusquedaScreen()));
                }
              },
            ),
            IconButton(
              iconSize: 50.0,
              icon: Image.asset(icono7),
              onPressed: () {
                if (icono7 == 'assets/images/bar.png') {
                  icono5 = 'assets/images/usuario.png';
                  icono6 = 'assets/images/comunidad.png';
                  icono7 = 'assets/images/bar_relleno.png';

                  buscaUsuario = false;
                  buscaBar = true;
                  buscaComunidad = false;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BusquedaScreen()));
                }
              },
            ),
          ],
        ),
      ]),
    );
  }
}

class UsuarioPage extends StatefulWidget {
  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: FutureBuilder(
              future: buscarUsuario(busuario),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(
                      child: Center(
                          child: Text(
                    S.current.nouser,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )));
                } else {
                  return ListView(children: <Widget>[
                    CircleAvatar(
                      radius: 100.0,
                      backgroundColor: PrimaryColor,
                      backgroundImage: NetworkImage(snapshot.data.imageUrl),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Divider(
                      color: Colors.purple[200],
                    ),
                    Text(
                      S.current.username,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      snapshot.data.username,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Divider(
                      color: Colors.purple[200],
                    ),
                    Text(
                      S.current.email,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      snapshot.data.email,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Divider(
                      color: Colors.purple[200],
                    ),
                    Text(
                      S.current.nombre,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      snapshot.data.nombre,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Divider(
                      color: Colors.purple[200],
                    ),
                    Text(
                      S.current.edad,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      snapshot.data.edad,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Divider(
                      color: Colors.purple[200],
                    ),
                    Text(
                      S.current.descripcion,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      snapshot.data.descripcion,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Divider(
                      color: Colors.purple[200],
                    ),
                    Text(
                      S.current.puntuacion,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      snapshot.data.puntuacion.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ]);
                }
              })),
    );
  }
}

class BarPage extends StatefulWidget {
  @override
  State<BarPage> createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {
  DateTime dt = new DateTime(0, 0, 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: FutureBuilder(
              future: buscarBar(bbar),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(
                      child: Center(
                          child: Text(
                    S.current.nouser,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )));
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (snapshot.data[index].agresion != " ") {
                          dt = DateTime.parse(snapshot.data[index].agresion);
                        }
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                height: 40.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AgresionDetailPage(
                                                  snapshot.data[index])));
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
                              SizedBox(
                                height: 30.0,
                              ),
                              CircleAvatar(
                                radius: 100.0,
                                backgroundColor: PrimaryColor,
                                backgroundImage:
                                    NetworkImage(snapshot.data[index].imageUrl),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Divider(
                                color: Colors.purple[200],
                              ),
                              Text(
                                S.current.nombrel,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data[index].name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Divider(
                                color: Colors.purple[200],
                              ),
                              Text(
                                S.current.direccion,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data[index].address,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Divider(
                                color: Colors.purple[200],
                              ),
                              Text(
                                S.current.musica,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data[index].musicTaste,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Divider(
                                color: Colors.purple[200],
                              ),
                              Text(
                                S.current.owner,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data[index].owner,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Divider(
                                color: Colors.purple[200],
                              ),
                              Text(
                                S.current.aforo,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data[index].aforo,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Divider(
                                color: Colors.purple[200],
                              ),
                              Text(
                                S.current.aforomax,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data[index].aforoMax,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Divider(
                                color: Colors.purple[200],
                              ),
                              Text(
                                S.current.horario,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data[index].horario,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Divider(
                                color: Colors.purple[200],
                              ),
                              Text(
                                S.current.descripcion,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data[index].descripcion,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                            ]);
                      });
                }
              })),
    );
  }
}

class ComunidadPage extends StatefulWidget {
  @override
  State<ComunidadPage> createState() => _ComunidadPageState();
}

class _ComunidadPageState extends State<ComunidadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: FutureBuilder(
                future: buscarComunidad(bcomunidad),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot.data);
                  if (snapshot.data == null) {
                    return Container(
                        child: Center(
                            child: Text(
                      S.current.nouser,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )));
                  } else {
                    return ListView(children: <Widget>[
                      SizedBox(
                        height: 40.0,
                      ),
                      CircleAvatar(
                        radius: 100.0,
                        backgroundColor: PrimaryColor,
                        backgroundImage: NetworkImage(snapshot.data.imageUrl),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Divider(
                        color: Colors.purple[200],
                      ),
                      Text(
                        S.current.nombrec,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        snapshot.data.name,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Divider(
                        color: Colors.purple[200],
                      ),
                      Text(
                        S.current.ownerc,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        snapshot.data.owner,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Divider(
                        color: Colors.purple[200],
                      ),
                      Text(
                        S.current.descripcion,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        snapshot.data.descripcion,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ]);
                  }
                })));
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
