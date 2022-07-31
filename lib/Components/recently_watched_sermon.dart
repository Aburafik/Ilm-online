import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Views/home/HomeCategories/videos_details.dart';
import 'package:ilm_online_app/providers/database_providers.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class RecentlyWatchedSermonsComponent extends StatelessWidget {
  RecentlyWatchedSermonsComponent({
    Key? key,
  }) : super(key: key);
  String imageUrl =
      "https://images.unsplash.com/photo-1570715746786-e7ca46b1e50b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG1vc3F1ZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60";
  @override
  Widget build(BuildContext context) {
    DatabaseProvider dbProvider =
        Provider.of<DatabaseProvider>(context, listen: true);

    List recentlyWatchedSermons = dbProvider.getRecentSermon;
    return SizedBox(
      // color: Colors.grey,
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text("RECENTLY WATCHED SERMONS",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: BLACK_COLOR)),
          ),
          Expanded(
            child: recentlyWatchedSermons.isEmpty
                ? shimmerLaoder()
                : ListView.builder(
                    itemCount: recentlyWatchedSermons.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      imageUrl,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  color: LIGHT_GREY_COLOR,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: IconButton(
                                  icon: const Icon(
                                    FeatherIcons.playCircle,
                                    color: PRIMARY_COLOR,
                                    size: 45,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VideoPlayerView(
                                          arguments:
                                              recentlyWatchedSermons[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3,
                            ),
                            child: Text(
                              "${recentlyWatchedSermons[index]["author"]}",
                              style: const TextStyle(
                                  color: BLACK_COLOR,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            height: 15,
                            child: Text(
                              "${recentlyWatchedSermons[index]["title"]}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

shimmerLaoder() {
  return ListView.builder(
    itemCount: 4,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
    highlightColor: Color.fromARGB(255, 216, 213, 213),
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                width: 200,
                decoration: BoxDecoration(
                    color: LIGHT_GREY_COLOR,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      FeatherIcons.playCircle,
                      color: PRIMARY_COLOR,
                      size: 45,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
              ),
              child: Text(
                "",
                style: const TextStyle(
                    color: BLACK_COLOR,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: 200,
              height: 15,
              child: Text(
                "",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
