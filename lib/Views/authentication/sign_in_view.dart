import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/sign_in_component.dart';
import 'package:ilm_online_app/Components/sign_up_component.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class SignInVC extends StatelessWidget {
  const SignInVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Column(
        children: [
          SizedBox(
            // ignore: sort_child_properties_last
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  //        Navigator.pushNamedAndRemoveUntil(
                  // context, "/Home-Decide-Screen", (route) => false);
                  Navigator.pushReplacementNamed(
                    context,
                    "/Home-Decide-Screen",
                  );
                  // Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          SignInComponent(
            key: key,
          )
        ],
      ),
    );
  }
}
