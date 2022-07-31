import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class PopularSermonsComponent extends StatelessWidget {
  PopularSermonsComponent({
    Key? key,
  }) : super(key: key);

  String imageUrl =
      "https://media.istockphoto.com/photos/silhouette-of-a-big-mosque-on-blue-full-moon-in-night-background-picture-id1219894876?b=1&k=20&m=1219894876&s=170667a&w=0&h=8J1-j3WrxCbY5fhPQfKKPAQVgWxRQ8gFhT1AZC5_SKc=";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.grey,
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text("POPULAR SERMONS",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: BLACK_COLOR)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 50,
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
                                    print("Play");
                                  },
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "Author name",
                            style: TextStyle(
                                color: BLACK_COLOR,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "Sermon Title",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
