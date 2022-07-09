import 'package:flutter/material.dart';

import 'package:ilm_online_app/Components/commons/common_button.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class UserActionComponent extends StatelessWidget {
  const UserActionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        commonButton(
            context: context,
            butttonColor: Colors.white,
            textColor: PRIMARY_COLOR,
            padding: 10,
            text: "SIGN UP",
            onPressed: () {
              Navigator.pushNamed(context, "/Sign-up-Screen");
            }),
        commonButton(
            hasBorderSide: true,
            context: context,
            textColor: Colors.white,
            padding: 10,
            text: "SIGN IN",
            onPressed: () {
              Navigator.pushNamed(context, "/Sign-in-Screen");
            }),
      ],
    );
  }
}
