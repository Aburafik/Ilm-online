// String? userName;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/providers/database_providers.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

CollectionReference accessUserDB =
    FirebaseFirestore.instance.collection('users');
final accessNewSermonDB =
    FirebaseFirestore.instance.collection('newSermon').get();
    final accessRecentSermonDB =
    FirebaseFirestore.instance.collection('recentSernons').get();

getUser(context) async {
  // final prefs = await SharedPreferences.getInstance();
  String userID = FirebaseAuth.instance.currentUser!.uid;
  final docRef = accessUserDB.doc(userID);
  docRef.get().then(
    (DocumentSnapshot doc) {
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      final data = doc.data() as Map<String, dynamic>;

      userProvider.setUserData(data);
      userProvider.setUserName(data['full_name']);
    },
    onError: (e) => print("Error getting document: $e"),
  );
}

///Get NewSermon from Database

getNewSermon(BuildContext context) async {
  await accessNewSermonDB.then((value) {
    DatabaseProvider dbProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    final data = value.docs[0].data();
    print("...........the data is ..................");
    // print(data);
    dbProvider.setNewSermon(data);

    print("...........the data is ..................");
  }, onError: (e) => print("Error getting document: $e"));
}

getRecentSermon(BuildContext context) async {
  accessRecentSermonDB .then((value) {
    DatabaseProvider dbProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    final data = value.docs.map((e) => e.data()).toList();
    print("...........the data is ..................");
    print(data);
    dbProvider.setRecentSermon(data);

    print("...........the data is ..................");
  }, onError: (e) => print("Error getting document: $e"));
}
