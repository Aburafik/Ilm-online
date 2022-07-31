import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({Key? key, this.arguments}) : super(key: key);

  final Map<String, dynamic>? arguments;

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerView> {
  FlickManager? flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network("${widget.arguments!["videoUrl"]}"),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flickManager!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            // padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 2.5,
            child: FlickVideoPlayer(flickManager: flickManager!),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Title: ${widget.arguments!["title"].toUpperCase()}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: BLACK_COLOR, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                    text: TextSpan(
                      text: "Description: ",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                            color: BLACK_COLOR,
                            height: 1.5,
                          ),
                      children: [
                        TextSpan(
                          text: "${widget.arguments!["description"]}",
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: BLACK_COLOR,
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
