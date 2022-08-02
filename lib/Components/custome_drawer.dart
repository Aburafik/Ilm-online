import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/drawer_items_widget.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';
import 'package:ilm_online_app/Repository/auth_repo.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  AuthUser authUser = AuthUser();
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);
    return Drawer(
      elevation: 0,
      backgroundColor: BLACK_COLOR,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
          ),
          drawerTilesWidget(
            context: context,
            title: "Profile",
            icon: FeatherIcons.user,
            onTap: () {
              Navigator.pop(context);
              userProvider.ontap(3);
            },
          ),
          drawerTilesWidget(
              context: context,
              title: "Notifications",
              icon: FeatherIcons.bell,
              trailing: circleDot(),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/notification-screen");
              }),
          // drawerTilesWidget(
          //   context: context,
          //   title: "Messages",
          //   icon: FeatherIcons.messageCircle,
          // ),
          // drawerTilesWidget(
          //   context: context,
          //   title: "Friends",
          //   icon: FeatherIcons.users,
          // ),
          drawerTilesWidget(
              context: context,
              title: "Q/A",
              icon: FeatherIcons.helpCircle,
              onTap: () {
                Navigator.pop(context);
                userProvider.ontap(4);
              }),
          drawerTilesWidget(
            context: context,
            title: "Settings",
            icon: FeatherIcons.settings,
          ),
          drawerTilesWidget(
            context: context,
            title: "Logout",
            icon: FeatherIcons.logOut,
            onTap: () {
              authUser.signOutUser(context: context);
            },
          ),
        ],
      ),
    );
  }
}
