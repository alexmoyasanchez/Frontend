import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/BarList/BarList_screen.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/components/create_post_container.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field_2.dart';
import 'package:flutter_auth/components/rounded_input_field_description.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/bar_model.dart';
import 'package:flutter_auth/constants.dart';
import 'dart:async';
import 'package:flutter_auth/Screens/MisBares/misbares_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';

class Body extends StatelessWidget {
  final Future<Bar> bar;

  Body({Key key, this.bar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
        child: FutureBuilder(
            future: getMisBares(),
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
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(snapshot.data[index].address,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                      trailing: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        EditPage(snapshot.data[index])));
                          }),
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
            }),
      ),
    );
  }
}

class EditPage extends StatefulWidget {
  final Bar bar;

  EditPage(this.bar);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final listItem = [
    'Pop',
    'Rock',
    'R&B',
    'Heavy Metal',
    'Hardcore',
    'Techno',
    'Reggaeton',
    'Salsa',
    "-"
  ];
  final listItem2 = [
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
  String newValue2;
  String aforo;
  String musicTaste;

  @override
  Widget build(BuildContext context) {
    String name = widget.bar.name;
    String address = widget.bar.address;
    String aforoMax = widget.bar.aforoMax;
    String horario = widget.bar.horario;
    String descripcion = widget.bar.descripcion;
    String aforo2 = widget.bar.aforo;
    String musicTaste2 = widget.bar.musicTaste;

    return Scaffold(
      backgroundColor: Colors.purple[200],
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          widget.bar.name,
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
            RoundedInputField2(
              hintText: S.current.nombrel + name,
              onChanged: (value) {
                name = value;
              },
            ),
            RoundedInputField2(
              hintText: S.current.direccion + address,
              onChanged: (value) {
                address = value;
              },
            ),
            DropdownButton(
                dropdownColor: Colors.purple[200],
                alignment: Alignment.centerRight,
                items: listItem.map(buildMenuItem).toList(),
                hint: Text(S.current.musica + musicTaste2,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    )),
                value: newValue,
                onChanged: (value) {
                  musicTaste = value;
                  setState(() {
                    newValue = value;
                  });
                }),
            RoundedInputField2(
              hintText: S.current.horario + horario,
              onChanged: (value) {
                horario = value;
              },
            ),
            DropdownButton(
                dropdownColor: Colors.purple[200],
                alignment: Alignment.centerRight,
                items: listItem2.map(buildMenuItem).toList(),
                hint: Text(S.current.aforo + aforo2,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    )),
                value: newValue2,
                onChanged: (value) {
                  aforo = value;
                  setState(() {
                    newValue2 = value;
                  });
                }),
            RoundedInputField2(
              hintText: S.current.aforomax + aforoMax,
              onChanged: (value) {
                aforoMax = value;
              },
            ),
            RoundedInputFieldLargo(
              hintText: S.current.descripcion2 + descripcion,
              onChanged: (value) {
                descripcion = value;
              },
            ),
            RoundedButton(
              text: S.current.editarl,
              color: kPrimaryLightColor,
              textColor: Colors.white,
              press: () {
                if (aforo == null) {
                  aforo = aforo2;
                }
                if (musicTaste == null) {
                  musicTaste = musicTaste2;
                }
                if ('$name' != "" &&
                    '$address' != "" &&
                    '$musicTaste' != "" &&
                    '$aforoMax' != "" &&
                    '$horario' != "" &&
                    '$descripcion' != "") {
                  editarBar(widget.bar.id, '$name', '$address', '$musicTaste',
                      '$aforo', '$aforoMax', '$horario', '$descripcion');
                  getBares();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MisBaresScreen();
                      },
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text("Error"),
                        content: new Text(S.current.campos),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new FlatButton(
                            child: new Text(S.current.close),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
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

  DetailPage(this.bar);

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CreatePostContainer(bar: bar),
          ),
        ],
      ),
    );
  }
}
