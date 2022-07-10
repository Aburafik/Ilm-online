import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class MostRecentSermonComponent extends StatelessWidget {
  const MostRecentSermonComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: LIGHT_GREY_COLOR,
          ),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: PRIMARY_COLOR,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Text(
                "New",
                style: TextStyle(color: WHITE_COLOR),
              ),
            ),
          ),
        )
      ],
    );
  }
}
