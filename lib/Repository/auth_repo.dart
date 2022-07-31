import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';
import 'package:ilm_online_app/Repository/db_repo.dart';
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
    final pref = await SharedPreferences.getInstance();

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
        getUser(context);
        pref.setString('user_id', value.user!.uid);
        UserProvider userProvider =
            Provider.of<UserProvider>(context, listen: false);
        userProvider.setUserID(value.user!.uid);

        showToast(msg: "Sign in Successful");
      }).timeout(const Duration(seconds: 60), onTimeout: () {});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast(msg: "The password provided is too weak.", color: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        showToast(
            msg: "An account already exists for that email.",
            color: Colors.red);
      } else {
        showToast(msg: "Something went wrong.", color: Colors.red);
      }
    } catch (e) {
      showToast(msg: e.toString(), color: Colors.red);
    }
  }

  ////SignIn User(

  signInUser({String? email, String? password, context}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        prefs.setString('Id', value.user!.uid);
        UserProvider userProvider =
            Provider.of<UserProvider>(context, listen: false);
        userProvider.setUserID(value.user!.uid);
        await getUser(context);
        Navigator.pushNamed(context, '/Home-Screen');
      }).timeout(const Duration(seconds: 60), onTimeout: () {
        showToast(
            msg: "Time out, please check your internet connection.",
            color: Colors.red);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast(msg: "No user found for that email.", color: Colors.red);
      } else if (e.code == 'wrong-password') {
        showToast(
            msg: 'Wrong password provided for that email.', color: Colors.red);
      } else {
        showToast(
            msg: "Please check your internet connection.", color: Colors.red);
      }
    }
  }

  ////SignOut User
  signOutUser({BuildContext? context}) async {
    final prefs = await SharedPreferences.getInstance();

    await _auth.signOut().then(
      (value) {
        startLoading();
        prefs.remove('name');
        prefs.remove('email');
        prefs.remove(
          'contact',
        );
        prefs.remove('profileImage');

        // prefs.remove(key)
        Future.delayed(
          const Duration(seconds: 4),
          () {
            stopLoading();

            Navigator.pushReplacementNamed(
              context!,
              "/Sign-in-Screen",
            );
          },
        );
      },
    );
  }

  ////Update User Profile
  Future<void> upDateUser(
      {String? fullName,
      String? contact,
      String? imageUrl,
      BuildContext? context,
      String? id}) async {
    // startLoading();
    final pref = await SharedPreferences.getInstance();
    pref.setString('Id', id!);
    return users.doc(id).set({
      'full_name': fullName,
      'contact': contact,
      'image_url': imageUrl,
    }, SetOptions(merge: true)).then((value) async {
      stopLoading();
      showToast(msg: "Profile Updated Successfully");
    });
  }
  // uploadImage

}
