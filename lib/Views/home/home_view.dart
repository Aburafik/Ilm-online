import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/bootom_nav_bar.dart';
import 'package:ilm_online_app/Components/drawer_items_widget.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';
import 'package:ilm_online_app/Views/discover/discover_view.dart';
import 'package:ilm_online_app/Views/donate/donote_view.dart';
import 'package:ilm_online_app/Views/home/home_category_view.dart';
import 'package:ilm_online_app/Views/profile/profile_view.dart';
import 'package:ilm_online_app/Views/questionsAndAnswers/questions_and_answers_view.dart';

class HomeVC extends StatefulWidget {
  const HomeVC({Key? key}) : super(key: key);

  @override
  State<HomeVC> createState() => _HomeVCState();
}

class _HomeVCState extends State<HomeVC> {
  int _selectedIndex = 0;
  ontap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = const [
    HomeCategoryVC(),
    DiscoverVC(),
    DonateVC(),
    ProfileVC(),
    QuestionsAndAnswersVC()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // ignore: sort_child_properties_last
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 100,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        DrawerItemsWidget(
                          title: "Profile",
                          icon: FeatherIcons.user,
                          onTap: () {
                            Navigator.pop(context);

                            setState(() {
                              _selectedIndex = 3;
                            });
                            // _selectedIndex = 3;
                            // Navigator.pushNamed(context, "/Profile-Screen");
                          },
                        ),
                        DrawerItemsWidget(
                          title: "Notifications",
                          icon: FeatherIcons.bell,
                          trailing: notificationStatusIcon,
                        ),
                        DrawerItemsWidget(
                          title: "Messages",
                          icon: FeatherIcons.messageCircle,
                        ),
                        DrawerItemsWidget(
                          title: "Friends",
                          icon: FeatherIcons.users,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        DrawerItemsWidget(
                          title: "Help",
                          icon: FeatherIcons.helpCircle,
                        ),
                        DrawerItemsWidget(
                          title: "Settings",
                          icon: FeatherIcons.settings,
                        ),
                        DrawerItemsWidget(
                          title: "Logout",
                          icon: FeatherIcons.logOut,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: BLACK_COLOR,
        width: MediaQuery.of(context).size.width * 0.6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(FeatherIcons.bell),
                onPressed: () {},
              ),
              notificationStatusIcon,
            ],
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: BottomNavBarComponent(
        currentIndex: _selectedIndex,
        onTap: ontap,
      ),
    );
  }
}
