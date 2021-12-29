import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ComunidadesList/comunidadeslist_screen.dart';
import 'package:flutter_auth/Screens/EditPerfil/editperfil_screen.dart';
import 'package:flutter_auth/Screens/MisComunidades/miscomunidades_screen.dart';
import 'package:flutter_auth/Screens/NewComunidad/newcomunidad_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field_2.dart';
import 'package:flutter_auth/components/rounded_input_field_description.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/Screens/SignUp/components/background.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name;
  String descripcion;
  String imagePath;
  var imageUrl = currentPhoto;

  bool isloading = false;
  final cloudinary = CloudinaryPublic("dbyf2oped", 'proyectoEA', cache: false);

  Future uploadImage() async {
    const url =
        "https://api.cloudinary.com/v1_1/dbyf2oped/auto/upload/w_200,h_200,c_fill,r_max";
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      isloading = true;
    });

    Dio dio = Dio();
    FormData formData = new FormData.fromMap({
      "file": await MultipartFile.fromFile(
        image.path,
      ),
      "upload_preset": "proyectoEA",
      "cloud_name": "dbyf2oped",
    });
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path,
              resourceType: CloudinaryResourceType.Image));
      currentPhoto = response.secureUrl;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return NewComunidadScreen();
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  Future uploadImage2() async {
    const url =
        "https://api.cloudinary.com/v1_1/dbyf2oped/auto/upload/w_200,h_200,c_fill,r_max";
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      isloading = true;
    });

    Dio dio = Dio();
    FormData formData = new FormData.fromMap({
      "file": await MultipartFile.fromFile(
        image.path,
      ),
      "upload_preset": "proyectoEA",
      "cloud_name": "dbyf2oped",
    });
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path,
              resourceType: CloudinaryResourceType.Image));
      currentPhoto = response.secureUrl;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return NewComunidadScreen();
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundColor: PrimaryColor,
              backgroundImage: NetworkImage(currentPhoto),
              child: IconButton(
                icon: Icon(Icons.add_a_photo, color: Colors.white),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text(S.current.foto),
                        content: new Text(S.current.seleccionFoto),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new FlatButton(
                            child: new Text(S.current.galeria),
                            onPressed: () {
                              uploadImage2();
                              
                            },
                          ),
                          new FlatButton(
                            child: new Text(S.current.camara),
                            onPressed: () {
                              Navigator.of(context).pop();
                              uploadImage();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            RoundedInputField2(
              hintText: S.current.nombrec,
              onChanged: (value) {
                name = value;
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
              press: () async {
                if ('$name' != "" && '$descripcion' != "") {
                  await createComunidad('$name', '$descripcion', currentPhoto);
                  currentPhoto = " ";
                  getComunidades();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MisComunidadesScreen();
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
