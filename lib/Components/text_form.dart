import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class TextFormFieldComponent extends StatelessWidget {
  TextFormFieldComponent({Key? key, this.labelText, this.textEditingController})
      : super(key: key);
  TextEditingController? textEditingController;
  String? labelText = "";
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please $labelText is required";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: LIGHT_YELLOW_COLOR,
        // hintStyle: TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedErrorBorder:
            const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
