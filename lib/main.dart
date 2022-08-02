import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Repository/q_and_a_provider.dart';
import 'package:ilm_online_app/app.dart';
import 'package:ilm_online_app/firebase_options.dart';
import 'package:ilm_online_app/providers/database_providers.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<UserProvider>(create: (context) => UserProvider()),
        ListenableProvider<DatabaseProvider>(
            create: (context) => DatabaseProvider()),
        ListenableProvider<QuestionsAndAnswersProvider>(
            create: (context) => QuestionsAndAnswersProvider()),
      ],
      child: MyApp(),
    ),
  );
}
