import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

Positioned notificationStatusIcon = Positioned(
  top: 10,
  right: 14,
  child: Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      color: RED_COLOR,
      borderRadius: BorderRadius.circular(5),
    ),
  ),
);

Padding sermonCategoryTitle() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Text("RECENT SERMONS",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: BLACK_COLOR)),
  );
}
