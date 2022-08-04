import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/notification_card.dart';

class NotificationsVC extends StatefulWidget {
  const NotificationsVC({Key? key}) : super(key: key);

  @override
  State<NotificationsVC> createState() => _NotificationsVCState();
}

class _NotificationsVCState extends State<NotificationsVC> {
  final Stream<QuerySnapshot> _notificationsStream =
      FirebaseFirestore.instance.collection('notifications').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _notificationsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index].data();

                  return NotificationCardComponent(
                    notifications: data,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                itemCount: snapshot.data!.docs.length);
          }
          return const Center(
            child: Text("Please wait..."),
          );
        },
      ),
    );
  }
}
