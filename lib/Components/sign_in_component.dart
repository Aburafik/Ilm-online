import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/commons/common_button.dart';
import 'package:ilm_online_app/Components/text_form.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';
import 'package:ilm_online_app/Repository/auth_repo.dart';

class SignInComponent extends StatefulWidget {
  const SignInComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInComponent> createState() => _SignInComponentState();
}

class _SignInComponentState extends State<SignInComponent> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();

  final AuthUser _authUser = AuthUser();

  @override
  Widget build(BuildContext context) {
    SizedBox miniSpacer = SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
    );

    return Expanded(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
            child: Column(
          children: [
            miniSpacer,
            const Text(
              "Sign In",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: BLACK_COLOR),
            ),
            miniSpacer,
            TextFormFieldComponent(
              focusNode: _emailFocusNode,
              nextfocusNode: _passwordFocusNode,
              labelText: "Email",
              textEditingController: _emailController,
            ),
            miniSpacer,
            TextFormFieldComponent(
              isFieldObsecure: true,
              focusNode: _passwordFocusNode,
              labelText: "Password",
              textEditingController: _passwordController,
            ),
            miniSpacer,
            commonButton(
              padding: 10,
              context: context,
              text: "CONTINUE",
              textColor: Colors.white,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  startLoading();
                  await _authUser.signInUser(
                    context: context,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  stopLoading();
                }
              },
            ),
            commonButton(
                butttonColor: Colors.white,
                hasBorderSide: true,
                context: context,
                textColor: BLACK_COLOR,
                padding: 10,
                text: "Recover Password",
                onPressed: () {
                  // Navigator.pushNamed(context, "/Sign-in-Screen");
                }),
          ],
        )),
      ),
    ));
  }
}
