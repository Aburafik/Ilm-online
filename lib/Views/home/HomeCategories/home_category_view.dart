import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Views/home/HomeCategories/sermons_view.dart';
import 'package:ilm_online_app/Views/home/HomeCategories/videos_details.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:scroll_navigation/scroll_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class HomeCategoryVC extends StatefulWidget {
  const HomeCategoryVC({Key? key}) : super(key: key);

  @override
  State<HomeCategoryVC> createState() => _HomeCategoryVCState();
}

class _HomeCategoryVCState extends State<HomeCategoryVC> {
  
  @override
  void initState() {
    super.initState();
    // getUser(context);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // getUser(context);
    // userProvider.setUserName(userName!);

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
              return ListView.builder(
                itemBuilder: ((context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey,
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
                            "",
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontSize: 16,
                                      color: BLACK_COLOR,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
              //  const Center(
              //   child: Text("Please Wait....."),
              // );
            }
          },
        ),
      ),
    );
  }
}
