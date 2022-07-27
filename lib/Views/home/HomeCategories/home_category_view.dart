import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Views/home/HomeCategories/sermons_view.dart';
import 'package:ilm_online_app/Views/home/HomeCategories/videos_details.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:scroll_navigation/scroll_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCategoryVC extends StatefulWidget {
  const HomeCategoryVC({Key? key}) : super(key: key);

  @override
  State<HomeCategoryVC> createState() => _HomeCategoryVCState();
}

class _HomeCategoryVCState extends State<HomeCategoryVC> {
  String? userName;
  CollectionReference db = FirebaseFirestore.instance.collection('users');
  getUser(context) async {
    final prefs = await SharedPreferences.getInstance();

    final docRef = db.doc(prefs.getString('Id'));
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        print(data);
        setState(() => userName = data['full_name']);
        prefs.setString('name', data['full_name']);
        prefs.setString('email', data['email']);
        prefs.setString('contact', data['contact']);

        UserProvider userProvider = Provider.of(context, listen: false);
        userProvider.setUserName(userName!);

        // prefs.setStringList("UserProfile", [
        //   data['full_name'],
        //   data['email'],
        //   data['phone_number'],
        //   // data['id'],
        //   // data['image_url'],
        // ]);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  void initState() {
  getUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getUser(context);

    return Scaffold(
      body: SafeArea(
        child: TitleScrollNavigation(
          identiferStyle: const NavigationIdentiferStyle(
            color: BLACK_COLOR,
          ),
          barStyle: TitleNavigationBarStyle(
            activeColor: BLACK_COLOR,
            background: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor),
            spaceBetween: MediaQuery.of(context).size.width / 2,
          ),
          titles: const [
            "SERMONS",
            "VIDEOS",
          ],
          pages: [
            const SermonVC(),

            ArticlesVC()
            // SamplePlayer()
          ],
        ),
      ),
    );
  }
}

// class ArticlesVC extends StatefulWidget {
//   const ArticlesVC({Key? key}) : super(key: key);

//   @override
//   State<ArticlesVC> createState() => _ArticlesVCState();
// }

class ArticlesVC extends StatelessWidget {
  Future<QuerySnapshot<Map<String, dynamic>>> db =
      FirebaseFirestore.instance.collection('videos').get();

  ArticlesVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: db,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index].data();
                  return GestureDetector(
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Icon(
                                FeatherIcons.video,
                                size: 30,
                                color: LIGHT_BLACK_COLOR,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Expanded(
                            child: Text(
                              data['title'],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontSize: 16,
                                    color: BLACK_COLOR,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerView(
                            arguments: data,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text("Please Wait....."),
              );
            }
          },
        ),
      ),
    );
  }
}
