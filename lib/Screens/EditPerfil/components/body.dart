import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Feed/feed_screen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/components/rounded_repeat_password_field.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/models/user_model.dart';
import 'package:flutter_auth/Screens/EditPerfil/editperfil_screen.dart';
import 'package:flutter_auth/Screens/EditPerfil/components/background.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final listItem = [
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
    '60',
    '61',
    '62',
    '63',
    '64',
    '65',
    '66',
    '67',
    '68',
    '69',
    '70',
    '71',
    '72',
    '73',
    '74',
    '75',
    '76',
    '77',
    '78',
    '79',
    '80',
    '81',
    '82',
    '83',
    '84',
    '85',
    '86',
    '87',
    '88',
    '89',
    '90',
    '91',
    '92',
    '93',
    '94',
    '95',
    '96',
    '97',
    '98',
    '99',
    '+99'
  ];
  String newValue;
  String edad = currentUser.edad;
  String nombre = currentUser.nombre.toString();
  String username = currentUser.username;
  String email = currentUser.email;
  String password = currentUser.password;
  String password2 = currentUser.password;
  String descripcion = currentUser.descripcion;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool emailValid = true;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "EDITAR PERFIL",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.pink[800]),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Correo: " + email,
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedInputField(
              hintText: "Nombre de Usuario: " + username,
              onChanged: (value) {
                username = value;
              },
            ),
            RoundedInputField(
              hintText: "Nombre: " + nombre,
              onChanged: (value) {
                nombre = value;
              },
            ),
            DropdownButton(
                items: listItem.map(buildMenuItem).toList(),
                hint: Text("Edad: " + edad),
                value: newValue,
                onChanged: (value) {
                  edad = value;
                  setState(() {
                    newValue = value;
                  });
                }),
            RoundedInputField(
              hintText: "Descripción: " + descripcion,
              onChanged: (value) {
                descripcion = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedRepeatPasswordField(
              onChanged: (value) {
                password2 = value;
              },
            ),
            RoundedButton(
              text: "EDITAR PERFIL",
              color: kPrimaryLightColor,
              textColor: Colors.white,
              press: () {
                if ('$username' != "" &&
                    '$password' != "" &&
                    '$email' != "" &&
                    '$nombre' != "" &&
                    '$edad' != "" &&
                    '$descripcion' != "") {
                  if ('$password2' == '$password') {
                    if (emailValid ==
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(email)) {
                      editarUser('$username', '$password', '$email', '$nombre',
                          '$edad', '$descripcion');
                      
                      return Future.delayed(
                          const Duration(seconds: 1),
                          () => 
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    getUserById();
                                    return FeedScreen();
                                  },
                                ),
                              ),);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text("Error"),
                            content: new Text("Formato del correo incorrecto"),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Cerrar"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text("Error"),
                          content: new Text("Las contraseñas no coinciden."),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("Cerrar"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text("Error"),
                        content: new Text("Faltan campos por rellenar."),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new FlatButton(
                            child: new Text("Cerrar"),
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
