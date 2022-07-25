import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection('users');

class AuthUser {
  ///Store the user's information
  Future<void> addUser(
      {String? email,
      String? fullName,
      String? contact,
      BuildContext? context,
      String? id}) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('Id', id!);
    return users.doc(id).set({
      'full_name': fullName,
      'email': email,
      'contact': contact,
      'created_at': DateTime.now(),
    }).then((value) {
      Navigator.pushNamed(context!, '/Home-Screen');
    });
  }

////SignUp User

  signUpUser(
      {String? email,
      String? password,
      String? fullName,
      context,
      String? contact}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) {
        addUser(
            email: email,
            fullName: fullName,
            context: context,
            contact: contact,
            id: value.user!.uid);

        UserProvider userProvider =
            Provider.of<UserProvider>(context, listen: false);
        userProvider.setUserID(value.user!.uid);

        showToastMessage(msg: "Sign in Successful");
      }).timeout(const Duration(seconds: 60), onTimeout: () {});
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
      final prefs = await SharedPreferences.getInstance();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        prefs.setString('Id', value.user!.uid);
        UserProvider userProvider =
            Provider.of<UserProvider>(context, listen: false);
        userProvider.setUserID(value.user!.uid);
        Navigator.pushNamed(context, '/Home-Screen');
      }).timeout(Duration(seconds: 60), onTimeout: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Time out, please check your internet connection.'),
          ),
        );
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
      startLoading();
      Future.delayed(Duration(seconds: 4), () {
        stopLoading();

        Navigator.pushReplacementNamed(
          context!,
          "/Sign-in-Screen",
        );
      });
    });
  }


  ////Update User Profile
  
  
}
