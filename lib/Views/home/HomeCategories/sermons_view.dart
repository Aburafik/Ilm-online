// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/most_recent_watched_sermon.dart';
import 'package:ilm_online_app/Components/popular_sermons.dart';
import 'package:ilm_online_app/Components/recent_articles.dart';
import 'package:ilm_online_app/Components/recently_watched_sermon.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';
import 'package:ilm_online_app/Components/welcome_user_header.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SermonVC extends StatelessWidget {
  const SermonVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeUserComponent(
              userName: userProvider.userName,
            ),
            MostRecentSermonComponent(),
            RecentlyWatchedSermonsComponent(),
            PopularSermonsComponent(),
            sermonCategoryTitle(),
            RecentArticlesComponent()
          ],
        ),
      ),
    );
  }
}
