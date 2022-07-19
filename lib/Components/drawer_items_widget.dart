import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';


  drawerTilesWidget({BuildContext? context,
  
   IconData? icon,
  String? title,
  Widget? trailing,
  void Function()? onTap
  
  }) {
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
            Navigator.pop(context!);
          },
    );
  }

