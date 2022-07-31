import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class RecentSermonsComponent extends StatelessWidget {
  RecentSermonsComponent({
    Key? key,
  }) : super(key: key);
  String imageUrl =
      "https://images.unsplash.com/photo-1590092794015-bce5431c83f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1vc3F1ZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                ),
                width: 350,
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
                      FeatherIcons.book,
                      color: LIGHT_GREY_COLOR,
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
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
