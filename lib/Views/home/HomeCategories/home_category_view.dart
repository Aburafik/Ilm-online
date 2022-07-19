import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Views/home/HomeCategories/sermons_view.dart';
import 'package:scroll_navigation/scroll_navigation.dart';

class HomeCategoryVC extends StatelessWidget {
  const HomeCategoryVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          child: TitleScrollNavigation(
            identiferStyle: NavigationIdentiferStyle(
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
              "ARTICLES",
            ],
            pages: [SermonVC(), ArticlesVC()],
          ),
        ),
        );
  }
}

class ArticlesVC extends StatelessWidget {
  const ArticlesVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Currently not Available"),
        ),
      ),
    );
  }
}
