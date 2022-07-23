import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/commons/common_button.dart';
import 'package:ilm_online_app/Components/text_form.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class ProfileVC extends StatelessWidget {
  ProfileVC({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController(text: "asdfdsfggfghdfghdghf");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Citizen Raf",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20),
              ),
            ),
            ProfileViewTextFormFieldComponent(
              labelText: "Email",
              textEditingController: emailController,
            ),
            commonButton(
              butttonColor: Color(0xffFEEFE7),
              padding: 5,
              context: context,
              text: "Manage Accounts",
              textColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
