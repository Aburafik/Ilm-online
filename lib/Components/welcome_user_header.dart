// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class WelcomeUserComponent extends StatelessWidget {
  WelcomeUserComponent({Key? key, this.userName}) : super(key: key);

  String? userName;

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hey ${userName ?? userProvider.userName}',
          style: const TextStyle(
              fontSize: 20, color: BLACK_COLOR, fontWeight: FontWeight.w500),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 8),
          child: Text(
            "Welcome to the Ilm Online App!",
            style: TextStyle(
                color: BLACK_COLOR, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const Text(
          "We promise to keep you up to date with the latest Sermons and hope that you will be blessed with our content",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
