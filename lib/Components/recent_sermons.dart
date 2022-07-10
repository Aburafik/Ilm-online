import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class RecentSermonsComponent extends StatelessWidget {
  const RecentSermonsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: GridView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                ),
                width: 350,
                decoration: BoxDecoration(
                    color: LIGHT_GREY_COLOR,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const Text(
              "Author name",
              style: TextStyle(
                  color: BLACK_COLOR,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const Text(
              "Sermon Title",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}