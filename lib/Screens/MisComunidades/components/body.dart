import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/EditPerfil/editperfil_screen.dart';
import 'package:flutter_auth/Screens/MisComunidades/miscomunidades_screen.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/components/create_post_container.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field_2.dart';
import 'package:flutter_auth/components/rounded_input_field_description.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/bar_model.dart';
import 'package:flutter_auth/constants.dart';
import 'dart:async';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  final Future<Bar> bar;

  Body({Key key, this.bar}) : super(key: key);

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
      child: Center(
        child: FutureBuilder(
            future: getComunidadesById(),
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
                      title: Text(snapshot.data[index].name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(snapshot.data[index].owner,
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
  final Comunidad comunidad;

  EditPage(this.comunidad);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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
      await updateComunidad(widget.comunidad.id, widget.comunidad.name, widget.comunidad.descripcion, currentPhoto);
      DeleteCurrentPhoto();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return MisComunidadesScreen();
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
      await updateComunidad(widget.comunidad.id, widget.comunidad.name, widget.comunidad.descripcion, currentPhoto);
      DeleteCurrentPhoto();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return MisComunidadesScreen();
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentPhoto = widget.comunidad.imageUrl;
    String name = widget.comunidad.name;
    String descripcion = widget.comunidad.descripcion;

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          widget.comunidad.name,
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
              hintText: S.current.nombrec + widget.comunidad.name,
              onChanged: (value) {
                name = value;
              },
            ),
            RoundedInputFieldLargo(
              hintText: S.current.descripcion2 + widget.comunidad.descripcion,
              onChanged: (value) {
                descripcion = value;
              },
            ),
            RoundedButton(
              text: S.current.editarC,
              color: Colors.white,
              textColor: Colors.black,
              press: () {
                if ('$name' != "" && '$descripcion' != "") {
                  updateComunidad(widget.comunidad.id,'$name', '$descripcion', currentPhoto);
                  DeleteCurrentPhoto();
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
            RoundedButton(
              text: S.current.eliminarc,
              color: Colors.white,
              textColor: Colors.black,
              press: () {
                deleteComunidad(widget.comunidad.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MisComunidadesScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Comunidad comunidad;

  DetailPage(this.comunidad);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          comunidad.name,
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
            CircleAvatar(
              radius: 100.0,
              backgroundColor: PrimaryColor,
              backgroundImage: NetworkImage(comunidad.imageUrl),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.nombrec,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              comunidad.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            Text(
              S.current.administrador,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              comunidad.owner,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.purple[200],
            ),
            /*Text(
              "Número de usuarios en la comunidad",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              comunidad.usuarios.length.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),*/
            Divider(
              color: Colors.purple[200],
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
              comunidad.descripcion,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.purple[200],
            ),
          ],
        ),
      ),
    );
  }
}
