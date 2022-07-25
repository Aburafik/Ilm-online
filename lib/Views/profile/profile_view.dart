import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/commons/common_button.dart';
import 'package:ilm_online_app/Components/text_form.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileVC extends StatefulWidget {
  ProfileVC({Key? key}) : super(key: key);

  @override
  State<ProfileVC> createState() => _ProfileVCState();
}

class _ProfileVCState extends State<ProfileVC> {
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  getUserInfor() async {
    final pref = await SharedPreferences.getInstance();

    // final value = pref.getStringList('UserProfile');
    setState(() {
      // print(value);
      emailController.text = pref.getString('email')!;
      phoneController.text = pref.getString('contact')!;
      nameController.text = pref.getString('name')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1609010697446-11f2155278f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2ZpbGUlMjBwaG90b3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"),
                    backgroundColor: LIGHT_GREY_COLOR,
                    radius: 60,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xff3C71FF),
                      child: Icon(
                        Icons.photo,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  nameController.text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 20),
                ),
              ),
              ProfileViewTextFormFieldComponent(
                // labelText: "Email",
                textEditingController: nameController,
              ),
              ProfileViewTextFormFieldComponent(
                // labelText: "Email",
                textEditingController: emailController,
              ),
              ProfileViewTextFormFieldComponent(
                // labelText: "Email",
                textEditingController: phoneController,
              ),
              commonButton(
                padding: 5,
                context: context,
                text: "Update",
                textColor: Colors.white,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
