// String? userName;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/providers/database_providers.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';


 CollectionReference accessUserFromDB =
    FirebaseFirestore.instance.collection('users');
final accessNewSermonFromDB =
    FirebaseFirestore.instance.collection('newSermon').get();
final accessRecentSermonFromDB =
    FirebaseFirestore.instance.collection('recentSernons').get();
final accessPopularSermonFromDB =
    FirebaseFirestore.instance.collection('popularSermons').get();
final accessArticlesFromDB =
    FirebaseFirestore.instance.collection('articles').get();

getUser(context) async {
  // final prefs = await SharedPreferences.getInstance();
  String userID = FirebaseAuth.instance.currentUser!.uid;
  final docRef = accessUserFromDB.doc(userID);
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
  await accessNewSermonFromDB.then((value) {
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
  accessRecentSermonFromDB.then((value) {
    DatabaseProvider dbProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    final data = value.docs.map((e) => e.data()).toList();
    print("...........the data is ..................");
    print(data);
    dbProvider.setRecentSermon(data);

    print("...........the data is ..................");
  }, onError: (e) => print("Error getting document: $e"));
}

getpopularSermon(BuildContext context) async {
  accessPopularSermonFromDB.then((value) {
    DatabaseProvider dbProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    final data = value.docs.map((e) => e.data()).toList();
    print("...........the data is ..................");
    print(data);
    dbProvider.setPopularSermon(data);

    print("...........the data is ..................");
  }, onError: (e) => print("Error getting document: $e"));
}

getArticles(BuildContext context) async {
  accessArticlesFromDB.then((value) {
    DatabaseProvider dbProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    final data = value.docs.map((e) => e.data()).toList();
    print("...........the data is ..................");
    print(data);
    dbProvider.setArticles(data);

    print("...........the data is ..................");
  }, onError: (e) => print("Error getting document: $e"));
}
