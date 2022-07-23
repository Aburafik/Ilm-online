import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

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
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: db,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs[index].data();
                userProvider.setItemCountFromDB(snapshot.data!.docs.length);
                return Card(
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, '/hadith-details',
                        arguments: data),
                    title: Text(data['title'],
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 16,
                            color: BLACK_COLOR,
                            fontWeight: FontWeight.w500)),
                    // subtitle: Text(snapshot.data!.docs[index].data()['content']),
                  ),
                );
              },
            );
          } else {
            print("No Data");
            return Text("No Data");
          }
        },
      ),
    );
  }
}
