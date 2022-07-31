import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class DiscoverVC extends StatefulWidget {
  const DiscoverVC({Key? key}) : super(key: key);

  @override
  State<DiscoverVC> createState() => _DiscoverVCState();
}

class _DiscoverVCState extends State<DiscoverVC> {
  Future<QuerySnapshot<Map<String, dynamic>>> db =
      FirebaseFirestore.instance.collection('hadiths').get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: db,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs[index].data();
                return Card(
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, '/hadith-details',
                        arguments: data),
                    title: Text(data['title'],
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 16,
                            color: BLACK_COLOR,
                            fontWeight: FontWeight.w500)),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No Data"));
          }
        },
      ),
    );
  }
}
