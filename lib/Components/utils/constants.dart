import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:toast/toast.dart';

String mostRecentSermonImageUrl =
    "https://images.unsplash.com/photo-1512632578888-169bbbc64f33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGlzbGFtfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60";

Positioned notificationStatusIcon =
    Positioned(top: 10, right: 14, child: circleDot());

Positioned notificationStatusCount =
    Positioned(top: 10, right: 14, child: circleDot());

Padding sermonCategoryTitle() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Text("RECENT ARTICLES",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: BLACK_COLOR)),
  );
}



startLoading() {
  return EasyLoading.show(
    // status: "Signing Up...",
    maskType: EasyLoadingMaskType.black,
  );
}

stopLoading() {
  return EasyLoading.dismiss();
}

circleDot() {
  return Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      color: RED_COLOR,
      borderRadius: BorderRadius.circular(5),
    ),
  );
}

showToast({String? msg, Color? color}) {
  return Fluttertoast.showToast(
      msg: msg!,
      gravity: ToastGravity.TOP,
      backgroundColor: color ?? Colors.green,
      // textColor: Colors.white,
      fontSize: 16.0);
}