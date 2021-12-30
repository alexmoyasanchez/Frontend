import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';

class Body extends StatelessWidget {
  String insignia1;
  String insignia2;
  String insignia3;
  String insignia4;
  String insignia5;
  String insignia6;
  String insignia7;
  String insignia8;
  String insignia9;
  String insignia10;
  String insignia11;
  String insignia12;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
        backgroundColor: Colors.black,
        drawer: SideBar(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: FutureBuilder(
                future: getUserById(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (currentUser.puntuacion < 25 &&
                      currentUser.puntuacion >= 0) {
                    insignia1 = 'assets/images/insignia1_desactivada.png';
                    insignia2 = 'assets/images/insignia2_desactivada.png';
                    insignia3 = 'assets/images/insignia3_desactivada.png';
                    insignia4 = 'assets/images/insignia4_desactivada.png';
                    insignia5 = 'assets/images/insignia5_desactivada.png';
                    insignia6 = 'assets/images/insignia6_desactivada.png';
                    insignia7 = 'assets/images/insignia7_desactivada.png';
                    insignia8 = 'assets/images/insignia8_desactivada.png';
                    insignia9 = 'assets/images/insignia9_desactivada.png';
                    insignia10 = 'assets/images/insignia10_desactivada.png';
                    insignia11 = 'assets/images/insignia11_desactivada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else if (currentUser.puntuacion < 50 &&
                      currentUser.puntuacion >= 25) {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_desactivada.png';
                    insignia3 = 'assets/images/insignia3_desactivada.png';
                    insignia4 = 'assets/images/insignia4_desactivada.png';
                    insignia5 = 'assets/images/insignia5_desactivada.png';
                    insignia6 = 'assets/images/insignia6_desactivada.png';
                    insignia7 = 'assets/images/insignia7_desactivada.png';
                    insignia8 = 'assets/images/insignia8_desactivada.png';
                    insignia9 = 'assets/images/insignia9_desactivada.png';
                    insignia10 = 'assets/images/insignia10_desactivada.png';
                    insignia11 = 'assets/images/insignia11_desactivada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else if (currentUser.puntuacion < 75 &&
                      currentUser.puntuacion >= 50) {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_activada.png';
                    insignia3 = 'assets/images/insignia3_desactivada.png';
                    insignia4 = 'assets/images/insignia4_desactivada.png';
                    insignia5 = 'assets/images/insignia5_desactivada.png';
                    insignia6 = 'assets/images/insignia6_desactivada.png';
                    insignia7 = 'assets/images/insignia7_desactivada.png';
                    insignia8 = 'assets/images/insignia8_desactivada.png';
                    insignia9 = 'assets/images/insignia9_desactivada.png';
                    insignia10 = 'assets/images/insignia10_desactivada.png';
                    insignia11 = 'assets/images/insignia11_desactivada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else if (currentUser.puntuacion < 100 &&
                      currentUser.puntuacion >= 75) {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_activada.png';
                    insignia3 = 'assets/images/insignia3_activada.png';
                    insignia4 = 'assets/images/insignia4_desactivada.png';
                    insignia5 = 'assets/images/insignia5_desactivada.png';
                    insignia6 = 'assets/images/insignia6_desactivada.png';
                    insignia7 = 'assets/images/insignia7_desactivada.png';
                    insignia8 = 'assets/images/insignia8_desactivada.png';
                    insignia9 = 'assets/images/insignia9_desactivada.png';
                    insignia10 = 'assets/images/insignia10_desactivada.png';
                    insignia11 = 'assets/images/insignia11_desactivada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else if (currentUser.puntuacion < 150 &&
                      currentUser.puntuacion >= 100) {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_activada.png';
                    insignia3 = 'assets/images/insignia3_activada.png';
                    insignia4 = 'assets/images/insignia4_activada.png';
                    insignia5 = 'assets/images/insignia5_desactivada.png';
                    insignia6 = 'assets/images/insignia6_desactivada.png';
                    insignia7 = 'assets/images/insignia7_desactivada.png';
                    insignia8 = 'assets/images/insignia8_desactivada.png';
                    insignia9 = 'assets/images/insignia9_desactivada.png';
                    insignia10 = 'assets/images/insignia10_desactivada.png';
                    insignia11 = 'assets/images/insignia11_desactivada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else if (currentUser.puntuacion < 200 &&
                      currentUser.puntuacion >= 150) {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_activada.png';
                    insignia3 = 'assets/images/insignia3_activada.png';
                    insignia4 = 'assets/images/insignia4_activada.png';
                    insignia5 = 'assets/images/insignia5_activada.png';
                    insignia6 = 'assets/images/insignia6_desactivada.png';
                    insignia7 = 'assets/images/insignia7_desactivada.png';
                    insignia8 = 'assets/images/insignia8_desactivada.png';
                    insignia9 = 'assets/images/insignia9_desactivada.png';
                    insignia10 = 'assets/images/insignia10_desactivada.png';
                    insignia11 = 'assets/images/insignia11_desactivada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else if (currentUser.puntuacion < 250 &&
                      currentUser.puntuacion >= 200) {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_activada.png';
                    insignia3 = 'assets/images/insignia3_activada.png';
                    insignia4 = 'assets/images/insignia4_activada.png';
                    insignia5 = 'assets/images/insignia5_activada.png';
                    insignia6 = 'assets/images/insignia6_activada.png';
                    insignia7 = 'assets/images/insignia7_desactivada.png';
                    insignia8 = 'assets/images/insignia8_desactivada.png';
                    insignia9 = 'assets/images/insignia9_desactivada.png';
                    insignia10 = 'assets/images/insignia10_desactivada.png';
                    insignia11 = 'assets/images/insignia11_desactivada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else if (currentUser.puntuacion < 300 &&
                      currentUser.puntuacion >= 250) {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_activada.png';
                    insignia3 = 'assets/images/insignia3_activada.png';
                    insignia4 = 'assets/images/insignia4_activada.png';
                    insignia5 = 'assets/images/insignia5_activada.png';
                    insignia6 = 'assets/images/insignia6_activada.png';
                    insignia7 = 'assets/images/insignia7_activada.png';
                    insignia8 = 'assets/images/insignia8_desactivada.png';
                    insignia9 = 'assets/images/insignia9_desactivada.png';
                    insignia10 = 'assets/images/insignia10_desactivada.png';
                    insignia11 = 'assets/images/insignia11_desactivada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else if (currentUser.puntuacion < 350 &&
                      currentUser.puntuacion >= 300) {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_activada.png';
                    insignia3 = 'assets/images/insignia3_activada.png';
                    insignia4 = 'assets/images/insignia4_activada.png';
                    insignia5 = 'assets/images/insignia5_activada.png';
                    insignia6 = 'assets/images/insignia6_activada.png';
                    insignia7 = 'assets/images/insignia7_activada.png';
                    insignia8 = 'assets/images/insignia8_activada.png';
                    insignia9 = 'assets/images/insignia9_desactivada.png';
                    insignia10 = 'assets/images/insignia10_desactivada.png';
                    insignia11 = 'assets/images/insignia11_desactivada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else if (currentUser.puntuacion < 400 &&
                      currentUser.puntuacion >= 350) {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_activada.png';
                    insignia3 = 'assets/images/insignia3_activada.png';
                    insignia4 = 'assets/images/insignia4_activada.png';
                    insignia5 = 'assets/images/insignia5_activada.png';
                    insignia6 = 'assets/images/insignia6_activada.png';
                    insignia7 = 'assets/images/insignia7_activada.png';
                    insignia8 = 'assets/images/insignia8_activada.png';
                    insignia9 = 'assets/images/insignia9_activada.png';
                    insignia10 = 'assets/images/insignia10_desactivada.png';
                    insignia11 = 'assets/images/insignia11_desactivada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else if (currentUser.puntuacion < 500 &&
                      currentUser.puntuacion >= 400) {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_activada.png';
                    insignia3 = 'assets/images/insignia3_activada.png';
                    insignia4 = 'assets/images/insignia4_activada.png';
                    insignia5 = 'assets/images/insignia5_activada.png';
                    insignia6 = 'assets/images/insignia6_activada.png';
                    insignia7 = 'assets/images/insignia7_activada.png';
                    insignia8 = 'assets/images/insignia8_activada.png';
                    insignia9 = 'assets/images/insignia9_activada.png';
                    insignia10 = 'assets/images/insignia10_activada.png';
                    insignia11 = 'assets/images/insignia11_desactivada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else if (currentUser.puntuacion < 1000 &&
                      currentUser.puntuacion >= 500) {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_activada.png';
                    insignia3 = 'assets/images/insignia3_activada.png';
                    insignia4 = 'assets/images/insignia4_activada.png';
                    insignia5 = 'assets/images/insignia5_activada.png';
                    insignia6 = 'assets/images/insignia6_activada.png';
                    insignia7 = 'assets/images/insignia7_activada.png';
                    insignia8 = 'assets/images/insignia8_activada.png';
                    insignia9 = 'assets/images/insignia9_activada.png';
                    insignia10 = 'assets/images/insignia10_activada.png';
                    insignia11 = 'assets/images/insignia11_activada.png';
                    insignia12 = 'assets/images/insignia12_desactivada.png';
                  } else {
                    insignia1 = 'assets/images/insignia1_activada.png';
                    insignia2 = 'assets/images/insignia2_activada.png';
                    insignia3 = 'assets/images/insignia3_activada.png';
                    insignia4 = 'assets/images/insignia4_activada.png';
                    insignia5 = 'assets/images/insignia5_activada.png';
                    insignia6 = 'assets/images/insignia6_activada.png';
                    insignia7 = 'assets/images/insignia7_activada.png';
                    insignia8 = 'assets/images/insignia8_activada.png';
                    insignia9 = 'assets/images/insignia9_activada.png';
                    insignia10 = 'assets/images/insignia10_activada.png';
                    insignia11 = 'assets/images/insignia11_activada.png';
                    insignia12 = 'assets/images/insignia12_activada.png';
                  }
                  return ListView(
                    children: <Widget>[
                      Divider(
                        color: Colors.black,
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia1),
                          ),
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia2),
                          ),
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia3),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia4),
                          ),
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia5),
                          ),
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia6),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia7),
                          ),
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia8),
                          ),
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia9),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia10),
                          ),
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia11),
                          ),
                          CircleAvatar(
                            radius: 58.0,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(insignia12),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10.0,
                      ),
                    ],
                  );
                })));
  }
}
