import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Feed/feed_screen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field_2.dart';
import 'package:flutter_auth/components/rounded_input_field_description.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/components/rounded_repeat_password_field.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/Screens/EditPerfil/editperfil_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';

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
  String imagePath;
  var imageUrl;

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
      imageUrl = response.secureUrl;
      currentPhoto = imageUrl;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return EditPerfilScreen();
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
      imageUrl = response.secureUrl;
      currentPhoto = imageUrl;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return EditPerfilScreen();
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool emailValid = true;
    if (currentPhoto == " ") {
      currentPhoto = currentUser.imageUrl;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          S.current.perfil,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100.0,
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
                hintText: S.current.correo2 + email,
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedInputField2(
                hintText: S.current.username2 + username,
                onChanged: (value) {
                  username = value;
                },
              ),
              RoundedInputField2(
                hintText: S.current.nombre2 + nombre,
                onChanged: (value) {
                  nombre = value;
                },
              ),
              /*DropdownButton(
                items: listItem.map(buildMenuItem).toList(),
                hint: Text(S.current.edad2 + edad),
                value: newValue,
                onChanged: (value) {
                  edad = value;
                  setState(() {
                    newValue = value;
                  });
                }),*/
              RaisedButton(
                color: Colors.white,
                textColor: Colors.black,
                child: Text(S.current.edad2),
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now())
                      .then((date) {
                    setState(() {
                      edad = date.toString();
                    });
                  });
                },
              ),
              RoundedInputFieldLargo(
                hintText: S.current.descripcion2 + descripcion,
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
                text: S.current.editar,
                color: Colors.white,
                textColor: Colors.black,
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
                        GuardarFotoUsuario(currentPhoto);
                        editarUser('$username', '$password', '$email',
                            '$nombre', '$edad', '$descripcion', currentPhoto);
                        DeleteCurrentPhoto();
                        return Future.delayed(
                          const Duration(seconds: 1),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                getUserById();
                                return FeedScreen();
                              },
                            ),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: new Text("Error"),
                              content: new Text(S.current.wrongc),
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
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text("Error"),
                            content: new Text(S.current.wrongp),
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
