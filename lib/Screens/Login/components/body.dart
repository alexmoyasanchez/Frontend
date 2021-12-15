import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/EditPerfil/editperfil_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/Screens/Feed/feed_screen.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String email;
    String password;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.current.iniciar,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: S.current.correo,
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: S.current.iniciar,
              color: Colors.white,
              textColor: Colors.black,
              press: () async {
                GuardarUsuario('$email', '$password');
                getUser();
                Login('$email', '$password');
                return Future.delayed(
                  const Duration(seconds: 1),
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if (currentUser.nombre == null || currentUser.nombre == "") {
                          return EditPerfilScreen();
                        } else {
                          return FeedScreen();
                        }
                      },
                    ),
                  )
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
