import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

commonButton({
  void Function()? onPressed,
  String? text,
  double padding = 0,
  BuildContext? context,
  bool hasBorderSide = false,
  Color? butttonColor,
  Color? textColor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: SizedBox(
      width: MediaQuery.of(context!).size.width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: butttonColor ?? PRIMARY_COLOR,
          side: hasBorderSide
              ? BorderSide(
                  color: Colors.white,
                  width: 1,
                )
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding),
          child: Text(
            text!,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
        ),
      ),
    ),
  );
}
