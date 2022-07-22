import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:toast/toast.dart';

Positioned notificationStatusIcon = Positioned(
  top: 10,
  right: 14,
  child: circleDot()
);

Padding sermonCategoryTitle() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Text("RECENT SERMONS",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: BLACK_COLOR)),
  );
}

showToastMessage({String? msg}) {
  Toast.show(msg!,
      duration: Toast.lengthShort,
      gravity: Toast.top,
      backgroundColor: Colors.green);
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
