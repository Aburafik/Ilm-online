import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(FeatherIcons.bell),
                onPressed: () {},
              ),
              Positioned(
                top: 10,
                right: 14,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: RED_COLOR,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
      bottomNavigationBar: BottomNavBarComponent(
        currentIndex: _selectedIndex,
        onTap: ontap,
      ),
    );
  }
}

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
        BottomNavigationBarItem(icon: Icon(FeatherIcons.heart), label: 'Give'),
        BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user), label: 'Profile'),
        BottomNavigationBarItem(
            icon: Icon(FeatherIcons.messageCircle), label: 'Q/A'),
      ],
    );
  }
}
