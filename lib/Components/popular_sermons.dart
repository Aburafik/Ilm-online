import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class PopularSermonsComponent extends StatelessWidget {
  const PopularSermonsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.grey,
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text("POPULAR SERMONS",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: BLACK_COLOR)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 50,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              width: 200,
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
                    )),
          )
        ],
      ),
    );
  }
}
