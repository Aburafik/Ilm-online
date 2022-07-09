import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/app_logo_description.dart';
import 'package:ilm_online_app/Components/user_action_area.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class HomeDecideVC extends StatelessWidget {
  const HomeDecideVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              const AppLogoDescriptionComponent(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              const UserActionComponent()
            ],
          ),
        ),
      ),
    );
  }
}
