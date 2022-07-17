import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/commons/common_button.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class ProfileVC extends StatelessWidget {
  const ProfileVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                radius: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Citizen Raf",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Expanded(
                  child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Text(
                        "Location",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Ghana, Tamale"),
                      ),
                      Divider(
                        color: PRIMARY_COLOR,
                      ),
                      Text(
                        "Bio",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum loremlorem ipsum lorem ipsum lorem "),
                      ),
                      Divider(
                        color: PRIMARY_COLOR,
                      ),
                      Text(
                        "Favorite Sermons",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum loremlorem ipsum lorem ipsum lorem "),
                      ),
                      Divider(
                        color: PRIMARY_COLOR,
                      ),
                      Text(
                        "Favorite Sermons",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "lorem ipsum lorem ipsum lorem ipsum lorem ipsum loremlorem ipsum lorem ipsum lorem "),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Privite account"),
                          Switch(value: true, onChanged: (value) {})
                        ],
                      ),
                      commonButton(
                        butttonColor: Color(0xffFEEFE7),
                        padding: 5,
                        context: context,
                        text: "Manage Accounts",
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
