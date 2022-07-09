import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class DrawerItemsWidget extends StatelessWidget {
  DrawerItemsWidget(
      {Key? key, this.icon, this.title, this.trailing, this.onTap})
      : super(key: key);
  IconData? icon;
  String? title;
  Widget? trailing;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailing,
      leading: Icon(
        icon,
        color: WHITE_COLOR,
      ),
      title: Text(
        title!,
        style: TextStyle(color: LIGHT_GREY_COLOR, fontSize: 16),
      ),
      onTap: onTap ??
          () {
            Navigator.pop(context);
          },
    );
  }
}
