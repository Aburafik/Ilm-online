import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class AuthUser {
////SignUp User

  signUpUser({String? email, String? password, context}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) {
        print(value.user!.uid);

        Navigator.pushNamed(context, '/Home-Screen',
            arguments: value.user!.uid);

        showToastMessage(msg: "Sign in Successful");
      }).timeout(const Duration(seconds: 60), onTimeout: () {
        print(('Timeout'));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The password provided is too weak.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The account already exists for that email.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${e.toString()}.'),
        ),
      );
    }
  }

  ////SignIn User(

  signInUser({String? email, String? password, context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        Navigator.pushNamed(context, '/Home-Screen');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong password provided for that email.'),
          ),
        );
      }
    }
  }

  ////SignOut User
  signOutUser({BuildContext? context}) async {
    await _auth.signOut().then((value) {
                Navigator.pushNamed(context!, "/Sign-in-Screen");

    });
  }
}
