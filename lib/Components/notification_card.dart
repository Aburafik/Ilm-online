import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

 class NotificationCardComponent extends StatelessWidget {
  const NotificationCardComponent({
    Key? key,this.notifications
  }) : super(key: key);

  final dynamic notifications;
  @override
  Widget build(BuildContext context) {
    
    return Card(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: PRIMARY_COLOR,
                child: Icon(
                  FeatherIcons.bell,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${notifications!['title']}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text("${notifications!['description']}",
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 14)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("date",
                            style: Theme.of(context).textTheme.caption),
                        Icon(FeatherIcons.clock, size: 15)
                      ],
                    )
                  ],
                ),
              ),
              const Icon(FeatherIcons.moreVertical)
            ],
          ),
        ),
      ),
    );
  }
}
