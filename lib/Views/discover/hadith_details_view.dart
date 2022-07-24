import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class HadithDetailsView extends StatelessWidget {
  const HadithDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                arguments['title'],
                style:
                    Theme.of(context).textTheme.headline5!.copyWith(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
            HadithsCard(arguments: arguments,index: "1",),
            HadithsCard(arguments: arguments,index: "2",),
          ],
        ),
      ),
    );
  }
}

class HadithsCard extends StatelessWidget {
   HadithsCard({
    Key? key,required this.index,
    required this.arguments,
  }) : super(key: key);

  final Map arguments;
   String index = "1";

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              arguments['narator$index'],
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontSize: 18, color: PRIMARY_COLOR),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '"${arguments['hadith$index']}"',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontSize: 17, fontStyle: FontStyle.italic,height: 1.5),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Reference:${arguments['reference$index']}',
              style:
                  Theme.of(context).textTheme.headline5!.copyWith(fontSize: 16),
            ),
            IconButton(onPressed: (){} ,icon:Icon(FeatherIcons.share2))
          ],
        ),
      ),
    );
  }
}
