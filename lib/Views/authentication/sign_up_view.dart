import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/sign_up_component.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class SignUpVC extends StatelessWidget {
  const SignUpVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
          SignUpComponent(
            key: key,
          )
        ],
      ),
    );
  }
}
