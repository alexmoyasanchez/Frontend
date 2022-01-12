import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

// class AuthService {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   String name;
//   String imageUrl;

//   String uid;
//   String userEmail;

//   Future<User> registerWithEmailPassword(String email, String password) async {
//     // Initialize Firebase
//     await Firebase.initializeApp();
//     User user;

//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       user = userCredential.user;

//       if (user != null) {
//         uid = user.uid;
//         userEmail = user.email;
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('An account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }

//     return user;
//   }

//   Future<User> signInWithEmailPassword(String email, String password) async {
//     await Firebase.initializeApp();
//     User user;

//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       user = userCredential.user;

//       if (user != null) {
//         uid = user.uid;
//         userEmail = user.email;

//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setBool('auth', true);
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided.');
//       }
//     }

//     return user;
//   }

//   // Future<User> signInWithGoogle() async {
//   //   // Initialize Firebase
//   //   await Firebase.initializeApp();
//   //   User user;

//   //   // The `GoogleAuthProvider` can only be used while running on the web
//   //   GoogleAuthProvider authProvider = GoogleAuthProvider();

//   //   try {
//   //     final UserCredential userCredential =
//   //         await auth.signInWithPopup(authProvider);

//   //     user = userCredential.user;
//   //   } catch (e) {
//   //     print(e);
//   //   }

//   //   if (user != null) {
//   //     uid = user.uid;
//   //     name = user.displayName;
//   //     userEmail = user.email;
//   //     imageUrl = user.photoURL;

//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     prefs.setBool('auth', true);
//   //   }

//   //   return user;
//   // }

//   static Future<User> signInWithGoogle() async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User user;

//     if (kIsWeb) {
//       GoogleAuthProvider authProvider = GoogleAuthProvider();

//       try {
//         final UserCredential userCredential =
//             await auth.signInWithPopup(authProvider);

//         user = userCredential.user;
//       } catch (e) {
//         print(e);
//       }
//     } else {
//       final GoogleSignIn googleSignIn = GoogleSignIn();

//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();

//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuthentication =
//             await googleSignInAccount.authentication;

//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );

//         try {
//           final UserCredential userCredential =
//               await auth.signInWithCredential(credential);

//           user = userCredential.user;
//         } on FirebaseAuthException catch (e) {
//           if (e.code == 'account-exists-with-different-credential') {
//             // ...
//           } else if (e.code == 'invalid-credential') {
//             // ...
//           }
//         } catch (e) {
//           // ...
//         }
//       }
//     }

//     return user;
//   }

// }

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
