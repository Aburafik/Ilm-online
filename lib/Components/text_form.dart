import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class TextFormFieldComponent extends StatelessWidget {
  TextFormFieldComponent({
    Key? key,
    this.labelText,
    this.textEditingController,
    this.textInputType,
    this.focusNode,
    this.nextfocusNode,
    this.isFieldObsecure = false,
  }) : super(key: key);
  TextEditingController? textEditingController;
  String? labelText = "";
  FocusNode? focusNode = FocusNode();
  FocusNode? nextfocusNode = FocusNode();
  TextInputType? textInputType = TextInputType.text;
  bool isFieldObsecure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isFieldObsecure,
      obscuringCharacter: '•',
      focusNode: focusNode,
      onEditingComplete: () {
        focusNode!.unfocus();
        // FocusNode(context).unfocus();
        // FocusScope.of(nextfocusNode);
        FocusScope.of(context).requestFocus(nextfocusNode);
      },
      keyboardType: textInputType,
      controller: textEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please $labelText is required";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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

class ProfileViewTextFormFieldComponent extends StatelessWidget {
  ProfileViewTextFormFieldComponent({
    Key? key,
    this.labelText,
    this.textEditingController,
    this.isFieldEnabled,
    this.onTap,
  }) : super(key: key);
  TextEditingController? textEditingController;
  String? labelText = "";
  void Function()? onTap;
  bool? isFieldEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: TextFormField(
          enabled: isFieldEnabled,
          controller: textEditingController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Please $labelText is required";
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            filled: true,
            fillColor: LIGHT_GREY_COLOR,
            hintText: labelText,
            // hintStyle: TextStyle(color: Colors.white),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            focusedErrorBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
