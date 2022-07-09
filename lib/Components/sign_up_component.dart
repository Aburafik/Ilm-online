import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/commons/common_button.dart';
import 'package:ilm_online_app/Components/text_form.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class SignUpComponent extends StatefulWidget {
  const SignUpComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpComponent> createState() => _SignUpComponentState();
}

class _SignUpComponentState extends State<SignUpComponent> {
  final formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizedBox maxSpacer = SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
    );
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
              "Sign Up",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: BLACK_COLOR),
            ),
            miniSpacer,
            TextFormFieldComponent(
              labelText: "Email",
              textEditingController: _emailController,
            ),
            miniSpacer,
            TextFormFieldComponent(
              labelText: "Password",
              textEditingController: _passwordController,
            ),
            miniSpacer,
            TextFormFieldComponent(
              labelText: "Confirm Password",
              textEditingController: _confirmPasswordController,
            ),
            miniSpacer,
            commonButton(
              padding: 10,
              context: context,
              text: "Sign Up",
              textColor: Colors.white,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, '/Home-Decide-Screen');
                }
              },
            ),
          ],
        )),
      ),
    ));
  }
}
