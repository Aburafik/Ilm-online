import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/bootom_nav_bar.dart';
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
      drawer: const Drawer(),
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
