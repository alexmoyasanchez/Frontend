import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ComunidadesList/comunidadeslist_screen.dart';
import 'package:flutter_auth/Screens/NewComunidad/newcomunidad_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field_2.dart';
import 'package:flutter_auth/components/rounded_input_field_description.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/Screens/SignUp/components/background.dart';
import 'package:image_picker/image_picker.dart';


class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  String name;
  String descripcion;
  String imagePath;

  @override
  Widget build(BuildContext context) {

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedInputField2(
              hintText: S.current.nombrec,
              onChanged: (value) {
                name = value;
              },
            ),
            Text("Selecciona la imagen: "),
            (imagePath == null) ? Container() : Image.file(File(imagePath)),
            RoundedButton(
              text: "SUBE UNA IMAGEN",
              color: Colors.white,
              textColor: Colors.black,
              press: () async{
                final ImagePicker _picker = ImagePicker();
                PickedFile _pickedFile = await _picker.getImage(source: ImageSource.gallery);
                //imagePath = _pickedFile.path;
                setState(() {
                  
                });
              },
            ),
            RoundedInputFieldLargo(
              hintText: S.current.descripcion2,
              onChanged: (value) {
                descripcion = value;
              },
            ),
            RoundedButton(
              text: S.current.crearc,
              color: Colors.white,
              textColor: Colors.black,
              press: () {
                if ('$name' != "" && '$descripcion' != "") {
                  createComunidad('$name','$descripcion');
                  getComunidades();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ListaComunidadesScreen();
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