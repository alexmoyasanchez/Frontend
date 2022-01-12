import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Screens/Signup/signup_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;



class Authentication {
  static Future<User> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await FirebaseAuth.instance.setPersistence(Persistence.SESSION);
    User user;
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;

          assert(user.email != null);
          assert(user.uid != null);
          String gMail = user.email;
          String iDuser = user.uid;
          UserAuthbyGoogle(gMail, iDuser);


      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;

          assert(user.email != null);
          assert(user.uid != null);
          String gMail = user.email;
          String iDuser = user.uid;
          UserAuthbyGoogle(gMail, iDuser);


        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            print("Error de credenciales: Contraseña incorrecta");
          } else if (e.code == 'invalid-credential') {
            print("Error de credenciales: Credenciales invalidas");
          }
        } catch (e) {
          print("Error");
        }
      }
    }

    return user;
  }

}
