import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/commons/common_button.dart';
import 'package:ilm_online_app/Components/text_form.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';
import 'package:ilm_online_app/Repository/auth_repo.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileVC extends StatefulWidget {
  const ProfileVC({Key? key}) : super(key: key);

  @override
  State<ProfileVC> createState() => _ProfileVCState();
}

class _ProfileVCState extends State<ProfileVC> {
  final _firebaseStorage = FirebaseStorage.instance;
  File? _image;
  final _imagePicker = ImagePicker();
  String? uploadFileUrl;

  // String? imageUrl;
  uploadImage({BuildContext? context}) async {
    showModalBottomSheet(
      context: context!,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(FeatherIcons.camera),
                    title: const Text('Take a photo'),
                    onTap: () async {
                      Navigator.pop(context);

                      await getImage(imageSource: ImageSource.camera);
                    },
                  ),
                  ListTile(
                    leading: const Icon(FeatherIcons.image),
                    title: const Text('Choose from gallery'),
                    onTap: () async {
                      Navigator.pop(context);

                      await getImage(imageSource: ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future getImage({ImageSource imageSource = ImageSource.camera}) async {
    XFile? selectedFile = await _imagePicker.pickImage(source: imageSource);
    File imageFile = File(selectedFile!.path);

    setState(() {
      _image = imageFile;
    });
    print(imageFile);
  }

  String userID = FirebaseAuth.instance.currentUser!.uid;
  //////// Upload image file function
  Future<String> uploadFile({File? file, String? userUid}) async {
    print(userID);
    try {
      ////get The path of cloud storage
      Reference storageRef = _firebaseStorage
          .ref()
          .child('profile_images')
          .child('${userUid!}.jpg');

      UploadTask storageUploadTask = storageRef.putFile(file!);

      TaskSnapshot snapshot = await storageUploadTask.whenComplete(
        () => storageRef.getDownloadURL().then(
          (imageUrl) {
            setState(
              () {
                uploadFileUrl = imageUrl;
              },
            );
          },
        ),
      );

      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      debugPrint('############ $e');
      return null!;
    }
  }

  final AuthUser _authUser = AuthUser();
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);
    emailController.text = userProvider.userData['email'];
    phoneController.text = userProvider.userData['contact'];
    nameController.text = userProvider.userData['full_name'];
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
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : userProvider.userData["image_url"] != null
                            ? NetworkImage(userProvider.userData["image_url"])
                            : const NetworkImage(
                                    "https://images.unsplash.com/photo-1609010697446-11f2155278f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2ZpbGUlMjBwaG90b3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
                                as ImageProvider,
                    backgroundColor: LIGHT_GREY_COLOR,
                    radius: 60,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: GestureDetector(
                      onTap: (() {
                        uploadImage(context: context);
                      }),
                      child: const CircleAvatar(
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
                  userProvider.userName,
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
                  print(userID);
                  print("...............................");

                  print(emailController.text);
                  print(nameController.text);
                  print("...............................");
                  startLoading();
                  await uploadFile(file: _image!, userUid: userID)
                      .then((value) {
                    print(value);
                    _authUser.upDateUser(
                        id: userID,
                        context: context,
                        imageUrl: uploadFileUrl,
                        fullName: nameController.text,
                        contact: phoneController.text);

                    stopLoading();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
