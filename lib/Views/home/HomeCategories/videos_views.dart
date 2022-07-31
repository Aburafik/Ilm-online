import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Views/home/HomeCategories/videos_details.dart';
import 'package:shimmer/shimmer.dart';

class VideosVC extends StatelessWidget {
  Future<QuerySnapshot<Map<String, dynamic>>> db =
      FirebaseFirestore.instance.collection('videos').get();

  VideosVC({Key? key}) : super(key: key);

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
                    baseColor: Colors.grey.withOpacity(0.5),
                    highlightColor: Color.fromARGB(255, 216, 213, 213),
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
                          child: Container(
                            color: PRIMARY_COLOR,
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
            }
          },
        ),
      ),
    );
  }
}