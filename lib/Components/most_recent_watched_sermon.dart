import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';
import 'package:ilm_online_app/Views/home/HomeCategories/videos_details.dart';
import 'package:ilm_online_app/providers/database_providers.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MostRecentSermonComponent extends StatelessWidget {
  const MostRecentSermonComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseProvider dbProvider =
        Provider.of<DatabaseProvider>(context, listen: true);
    return dbProvider.getNewSermon["title"] == null
        ? shimmerLoader(context)
        : Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: LIGHT_GREY_COLOR,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      mostRecentSermonImageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    IconButton(
                      icon: const Icon(
                        FeatherIcons.play,
                        color: WHITE_COLOR,
                        size: 45,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPlayerView(
                                      arguments: dbProvider.getNewSermon,
                                    )));
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.withOpacity(0.5),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "${dbProvider.getNewSermon["title"].toUpperCase()}",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: WHITE_COLOR,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: PRIMARY_COLOR,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      "New",
                      style: TextStyle(color: WHITE_COLOR),
                    ),
                  ),
                ),
              )
            ],
          );
  }
}

shimmerLoader(BuildContext context) {
  return Shimmer.fromColors(
     baseColor: Colors.grey.withOpacity(0.5),
    highlightColor: Color.fromARGB(255, 216, 213, 213),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          IconButton(
            icon: const Icon(
              FeatherIcons.play,
              color: WHITE_COLOR,
              size: 45,
            ),
            onPressed: () {},
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red.withOpacity(0.5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "",
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
