import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/commons/common_button.dart';
import 'package:ilm_online_app/Components/text_form.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Repository/auth_repo.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileVC extends StatefulWidget {
  ProfileVC({Key? key}) : super(key: key);

  @override
  State<ProfileVC> createState() => _ProfileVCState();
}

class _ProfileVCState extends State<ProfileVC> {
  String? imageUrl;
  uploadImage() async {
    final firebaseStorage = FirebaseStorage.instance;
    final imagePicker = ImagePicker();
    XFile? image;
// Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      image = await imagePicker.pickImage(source: ImageSource.gallery);
// getImage(source: ImageSource.gallery);
      var file = File(image!.path);
      if (image != null) {
//Upload to Firebase
        var snapshot = await firebaseStorage
            .ref()
            .child('images/imageName')
            .putFile(file)
            .whenComplete(() => null);
        // .onComplete;
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }

  final AuthUser _authUser = AuthUser();
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
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1609010697446-11f2155278f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2ZpbGUlMjBwaG90b3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"),
                    backgroundColor: LIGHT_GREY_COLOR,
                    radius: 60,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: GestureDetector(
                      onTap: (() {
                        uploadImage();
                      }),
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
                onPressed: () async {
                  await _authUser.upDateUser(
                    id: userProvider.userID,
                      context: context,
                      fullName: nameController.text,
                      contact: phoneController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
