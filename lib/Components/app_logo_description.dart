import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class AppLogoDescriptionComponent extends StatelessWidget {
  const AppLogoDescriptionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      CircleAvatar(
        radius: 50,
        backgroundColor: BLACK_COLOR,
        child: Text(
          "ILM",
          style: TextStyle(color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "ILM",
          style: TextStyle(color: BLACK_COLOR, fontWeight: FontWeight.bold),
        ),
      ),
      Text(
        "Online",
        style: TextStyle(color: BLACK_COLOR, letterSpacing: 10),
      )
    ]);
  }
}
