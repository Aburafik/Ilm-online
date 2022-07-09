import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class BottomNavBarComponent extends StatelessWidget {
  BottomNavBarComponent({Key? key, this.currentIndex, this.onTap})
      : super(key: key);

  int? currentIndex;
  Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      selectedItemColor: PRIMARY_COLOR,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: currentIndex ?? 0,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(FeatherIcons.search), label: 'Discover'),
        BottomNavigationBarItem(
            icon: Icon(FeatherIcons.heart), label: 'Donate'),
        BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user), label: 'Profile'),
        BottomNavigationBarItem(
            icon: Icon(FeatherIcons.messageCircle), label: 'Q/A'),
      ],
    );
  }
}
