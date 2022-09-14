import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Components/utils/constants.dart';
import 'package:ilm_online_app/Repository/auth_repo.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class QuestionsAndAnswersVC extends StatefulWidget {
  const QuestionsAndAnswersVC({Key? key}) : super(key: key);

  @override
  State<QuestionsAndAnswersVC> createState() => _QuestionsAndAnswersVCState();
}

class _QuestionsAndAnswersVCState extends State<QuestionsAndAnswersVC> {
  final TextEditingController _questionController = TextEditingController();

  final Stream<QuerySnapshot> _questionsAndAnswersStream =
      FirebaseFirestore.instance.collection('questionsAndAnswers').snapshots();

  final AuthUser _authUser = AuthUser();

  ///ISAHIT

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);
    String senderName = userProvider.userData['full_name'] ?? "";
    String senderEmail = userProvider.userData['email'] ?? "";
    String senderContact = userProvider.userData["contact"] ?? "";
    return Scaffold(
      backgroundColor: LIGHT_YELLOW_COLOR.withOpacity(.1),
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
                          reverse: true,
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            dynamic data = snapshots.data!.docs[index].data();

                            var dateTime = DateTime.fromMillisecondsSinceEpoch(
                                data['created_at']);

                            var formatDate = DateFormat('k:mm a')
                                .format(dateTime)
                                .toString();
                            return Bubble(
                              color: data["senderId"] != _auth.currentUser!.uid
                                  ? WHITE_COLOR
                                  : const Color(0xffE1FFC7),
                              radius: const Radius.circular(20),
                              margin: const BubbleEdges.only(top: 10),
                              elevation: 0,
                              alignment:
                                  data["senderId"] == _auth.currentUser!.uid
                                      ? Alignment.topRight
                                      : Alignment.topLeft,
                              nip: data["senderId"] == _auth.currentUser!.uid
                                  ? BubbleNip.rightTop
                                  : BubbleNip.leftTop,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        formatDate.toLowerCase(),
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return const Text("Loading...");
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: false,
                controller: _questionController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Ask Question...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: WHITE_COLOR,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      if (_questionController.text.isEmpty) {
                        showToast(
                            msg:
                                "Question field can't be empty.Please enter question",
                            color: Colors.red);
                      } else {
                        await _authUser.sendQuestion(
                            id: _auth.currentUser!.uid,
                            question: _questionController.text,
                            senderName: senderName,
                            senderEmail: senderEmail,
                            senderContact: senderContact);
                      }
                      _questionController.clear();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
