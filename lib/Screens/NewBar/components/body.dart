import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/BarList/barlist_screen.dart';
import 'package:flutter_auth/Screens/NewBar/newbar_screen.dart';
import 'package:flutter_auth/Screens/MisBares/misbares_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field_2.dart';
import 'package:flutter_auth/components/rounded_input_field_description.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/Screens/EditPerfil/components/background.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final listItem = ['Pop', 'Rock', 'R&B', 'Heavy Metal', 'Hardcore', 'Techno', 'Reggaeton', 'Salsa', "-"];
  String newValue;
  String nombre;
  String address;
  String musicTaste;
  String aforoMax;
  String horario;
  String descripcion;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedInputField2(
              hintText: S.current.nombrel,
              onChanged: (value) {
                nombre = value;
              },
            ),
            RoundedInputField2(
              hintText: S.current.direccion,
              onChanged: (value) {
                address = value;
              },
            ),
            DropdownButton(
                items: listItem.map(buildMenuItem).toList(),
                hint: Text(S.current.musica),
                value: newValue,
                onChanged: (value) {
                  musicTaste = value;
                  setState(() {
                    newValue = value;
                  });
                }),
            RoundedInputField2(
              hintText: S.current.horario,
              onChanged: (value) {
                horario = value;
              },
            ),
            RoundedInputField2(
              hintText: S.current.aforomax,
              onChanged: (value) {
                aforoMax = value;
              },
            ),
            RoundedInputFieldLargo(
              hintText: S.current.descripcion2,
              onChanged: (value) {
                descripcion = value;
              },
            ),
            RoundedButton(
              text: S.current.crearl,
              color: kPrimaryLightColor,
              textColor: Colors.white,
              press: () {
                if ('$nombre' != "" && '$address' != "" && '$musicTaste' != "" && '$aforoMax' != "" && '$horario' != "" && '$descripcion' != "") {
                  createBar('$nombre', '$address', '$musicTaste', '$aforoMax', '$horario', '$descripcion');
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