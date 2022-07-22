import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/commons/common_button.dart';
import 'package:ilm_online_app/Components/text_form.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';
import 'package:ilm_online_app/Repository/auth_repo.dart';
import 'package:toast/toast.dart';

class SignUpComponent extends StatefulWidget {
  const SignUpComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpComponent> createState() => _SignUpComponentState();
}

class _SignUpComponentState extends State<SignUpComponent> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final AuthUser _authUser = AuthUser();
  RegExp exp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
      caseSensitive: false);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    SizedBox maxSpacer = SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
    );
    SizedBox miniSpacer = SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
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
                labelText: "Full Name",
                textEditingController: _nameController,
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
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (!exp.hasMatch(_emailController.text)) {
                      Toast.show("Invalid Email", duration: 2, gravity: 2);
                      return;
                    }

                    startLoading();
                    await _authUser.signUpUser(
                      context: context,
                      email: _emailController.text,
                      password: _passwordController.text,
                      fullName: _nameController.text,
                    );
                    stopLoading();
                  }
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}
