import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Repository/auth_repo.dart';
import 'package:ilm_online_app/Repository/q_and_a_provider.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class QuestionsAndAnswersVC extends StatefulWidget {
  QuestionsAndAnswersVC({Key? key}) : super(key: key);

  @override
  State<QuestionsAndAnswersVC> createState() => _QuestionsAndAnswersVCState();
}

class _QuestionsAndAnswersVCState extends State<QuestionsAndAnswersVC> {
  TextEditingController _questionController = TextEditingController();
  final Stream<QuerySnapshot> _questionsAndAnswersStream =
      FirebaseFirestore.instance.collection('questionsAndAnswers').snapshots();
  final AuthUser _authUser = AuthUser();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    QuestionsAndAnswersProvider qAndAProvider =
        Provider.of<QuestionsAndAnswersProvider>(context, listen: true);

    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);
    String senderName = userProvider.userData['full_name'] ?? "";
    String senderEmail = userProvider.userData['email'] ?? "";
    String senderContact = userProvider.userData["image_url"] ?? "";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: _questionsAndAnswersStream,
                    builder: (context, snapshots) {
                      if (snapshots.hasData) {
                        return ListView.builder(
                            // reverse: true,
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              dynamic data = snapshots.data!.docs[index].data();

                              var dateTime = DateTime.fromMillisecondsSinceEpoch(
                                  data['created_at']);

                              var formatDate = DateFormat('k:mm a')
                                  .format(dateTime)
                                  .toString();
                              return Align(
                                alignment:
                                    data["senderId"] == _auth.currentUser!.uid
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 10,
                                      left: data["senderId"] ==
                                              _auth.currentUser!.uid
                                          ? 50
                                          : 10,
                                      right: 10,
                                      bottom: 10),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                  decoration: const BoxDecoration(
                                    color: LIGHT_GREY_COLOR,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(0),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(25),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      data["senderId"] != _auth.currentUser!.uid
                                          ? Text(
                                              data['full_name'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(color: PRIMARY_COLOR),
                                            )
                                          : Wrap(),
                                      Text(
                                        "${data['question']}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: BLACK_COLOR),
                                      ),
                                      Text(formatDate.toString().toLowerCase())
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                      return Text("Loading...");
                    })),
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'Add Question',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: LIGHT_GREY_COLOR,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    await _authUser.sendQuestion(
                        id: _auth.currentUser!.uid,
                        question: _questionController.text,
                        senderName: senderName,
                        senderEmail: senderEmail,
                        senderContact: senderContact);

                    _questionController.clear();
                  },
                  icon: Icon(Icons.send),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
