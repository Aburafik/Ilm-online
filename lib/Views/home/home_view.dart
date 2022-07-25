import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/bootom_nav_bar.dart';
import 'package:ilm_online_app/Components/custome_drawer.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';
import 'package:ilm_online_app/Views/discover/discover_view.dart';
import 'package:ilm_online_app/Views/donate/donote_view.dart';
import 'package:ilm_online_app/Views/home/HomeCategories/home_category_view.dart';
import 'package:ilm_online_app/Views/profile/profile_view.dart';
import 'package:ilm_online_app/Views/questionsAndAnswers/questions_and_answers_view.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeVC extends StatelessWidget {
  List<Widget> pages = [
    const HomeCategoryVC(),
    const DiscoverVC(),
    const DonateVC(),
    ProfileVC(),
    const QuestionsAndAnswersVC()
  ];

  HomeVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        actions: [
          InkWell(
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(FeatherIcons.bell),
                  onPressed: () {
                    Navigator.pushNamed(context, "/notification-screen");
                  },
                ),
                userProvider.notificationCount == 0
                    ? notificationStatusIcon
                    : Positioned(
                        top: 10,
                        right: 14,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            color: BLACK_COLOR,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "${userProvider.notificationCount}",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
              ],
            ),
            onTap: () {
              print("Notification tapped");
              Navigator.pushNamed(context, "/notification-screen");
            },
          ),
        ],
      ),
      body: IndexedStack(index: userProvider.selectedIndex, children: pages),
      bottomNavigationBar: BottomNavBarComponent(
        currentIndex: userProvider.selectedIndex,
        onTap: userProvider.ontap,
      ),
    );
  }
}
