import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/BarList/barlist_screen.dart';
import 'package:flutter_auth/Screens/Map/ui/pages/home/map_screen.dart';
import 'package:flutter_auth/Screens/NewBar/newbar_screen.dart';
import 'package:flutter_auth/Screens/MisBares/misbares_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field_2.dart';
import 'package:flutter_auth/components/rounded_input_field_description.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/Screens/SignUp/components/background.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
  String newValue;
  String nombre;
  String address;
  String musicTaste;
  String aforoMax;
  String horario;
  String descripcion;
  var imageUrl = currentPhoto;

  bool isloading = false;
  final cloudinary = CloudinaryPublic("dbyf2oped", 'proyectoEA', cache: false);

  Future uploadImage() async {
    const url =
        "https://api.cloudinary.com/v1_1/dbyf2oped/auto/upload/w_200,h_200,c_fill,r_max";
    var image = await ImagePicker.platform.getImage(source: ImageSource.camera);

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
          return NewBarScreen();
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  Future uploadImage2() async {
    const url =
        "https://api.cloudinary.com/v1_1/dbyf2oped/auto/upload/w_200,h_200,c_fill,r_max";
    var image = await ImagePicker.platform.getImage(source: ImageSource.gallery);

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
          return NewBarScreen();
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(
                  height: 20.0,
                  thickness: 2.0,
                  color: Colors.black,
            ),
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
            RoundedButton(
              text: S.current.localizarl,
              color: Colors.white,
              textColor: Colors.black,
              press: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MapScreen3(); //CAMBIAR PANTALLA
                      },
                    ),
                  );
              },
            ),
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
                dropdownColor: Colors.black,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                items: listItem.map(buildMenuItem).toList(),
                hint: Text(
                  S.current.musica,
                  style: TextStyle(color: Colors.white),
                ),
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
              color: Colors.white,
              textColor: Colors.black,
              press: () async {
                if ('$nombre' != "" &&
                    '$address' != "" &&
                    '$musicTaste' != "" &&
                    '$aforoMax' != "" &&
                    '$horario' != "" &&
                    '$descripcion' != "") {
                  await createBar('$nombre', '$address', '$musicTaste', '$aforoMax',
                      '$horario', '$descripcion', currentPhoto, latitud, longitud);
                  await getBares();
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
