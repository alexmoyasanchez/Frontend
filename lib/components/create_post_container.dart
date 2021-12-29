export 'circle_button.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Feed/feed_screen.dart';
import 'package:flutter_auth/Screens/MisBares/misbares_screen.dart';
import 'package:flutter_auth/components/profile_avatar.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostContainer extends StatefulWidget {
  final Bar bar;

  const CreatePostContainer({
    Key key,
    @required this.bar,
  }) : super(key: key);

  @override
  State<CreatePostContainer> createState() => _CreatePostContainerState();
}

class _CreatePostContainerState extends State<CreatePostContainer> {
  String texto;
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
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    texto = value;
                  },
                  maxLines: 25,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration.collapsed(
                      hintText: S.current.post,
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
            color: Colors.white,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
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
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text(S.current.foto,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
            color: Colors.white,
          ),
          RoundedButton(
            text: S.current.crearp,
            color: Colors.white,
            textColor: Colors.black,
            press: () {
              newPost(texto, widget.bar, currentPhoto);
              getPosts();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FeedScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
