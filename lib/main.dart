import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/Repository/q_and_a_provider.dart';
import 'package:ilm_online_app/app.dart';
import 'package:ilm_online_app/firebase_options.dart';
import 'package:ilm_online_app/providers/database_providers.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

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
