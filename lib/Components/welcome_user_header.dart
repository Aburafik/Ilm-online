import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeUserComponent extends StatefulWidget {
  @override
  State<WelcomeUserComponent> createState() => _WelcomeUserComponentState();
}

class _WelcomeUserComponentState extends State<WelcomeUserComponent> {
  String? userName;
  CollectionReference db = FirebaseFirestore.instance.collection('users');
  getUser() async {
    final prefs = await SharedPreferences.getInstance();

    final docRef = db.doc(prefs.getString('Id'));
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() => userName = data['full_name']);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  void initState() {
    getUser();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hey ${userName ?? ""}',
          style: const TextStyle(
              fontSize: 20, color: BLACK_COLOR, fontWeight: FontWeight.w500),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 8),
          child: Text(
            "Welcome to the Ilm Online App!",
            style: TextStyle(
                color: BLACK_COLOR, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const Text(
          "We promise to keep you up to date with the latest Sermons and hope that you will be blessed with our content",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
