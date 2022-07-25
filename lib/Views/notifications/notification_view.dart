import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class NotificationsVC extends StatefulWidget {
  const NotificationsVC({Key? key}) : super(key: key);

  @override
  State<NotificationsVC> createState() => _NotificationsVCState();
}

class _NotificationsVCState extends State<NotificationsVC> {
  // Stream<DocumentSnapshot> db =
  //     FirebaseFirestore.instance.collection('notifications').doc().get().snapshots();
  Future<QuerySnapshot<Map<String, dynamic>>> db =
      FirebaseFirestore.instance.collection('notifications').get();
       final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('notifications').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {

                    final data = snapshot.data!.docs[index].data();

                    print(data);
                    // Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
                    // final data = snapshot.data![index];
                    // final data = snapshot.data.[index].data();
                    return NotificationCard(notifications: data ,);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  itemCount: snapshot.data!.docs.length);
            }
            return Center(
              child: Text("Please wait..."),
            );
          }),
    );
  }
}

class NotificationCard extends StatelessWidget {
  NotificationCard({
    Key? key,this.notifications
  }) : super(key: key);

  final notifications;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: PRIMARY_COLOR,
                child: Icon(
                  FeatherIcons.bell,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${notifications!['title']}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text("${notifications!['description']}",
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 14)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("Date and Time"),
                        Icon(FeatherIcons.clock, size: 15)
                      ],
                    )
                  ],
                ),
              ),
              const Icon(FeatherIcons.moreVertical)
            ],
          ),
        ),
      ),
    );
  }
}
