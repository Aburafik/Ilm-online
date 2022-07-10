
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class WelcomeUserComponent extends StatelessWidget {
  const WelcomeUserComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:const[
        Text(
          'Hey User,',
          style: TextStyle(
              fontSize: 20, color: BLACK_COLOR, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 8),
          child: Text(
            "Welcome to the Ilm Online App!",
            style: TextStyle(
                color: BLACK_COLOR, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          "We promise to keep you up to date with the latest Sermons and hope that you will be blessed with our content",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
