import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Repository/db_repo.dart';
import 'package:ilm_online_app/Views/authentication/sign_in_view.dart';
import 'package:ilm_online_app/Views/authentication/sign_up_view.dart';
import 'package:ilm_online_app/Views/discover/hadith_details_view.dart';
import 'package:ilm_online_app/Views/home/HomeCategories/videos_details.dart';
import 'package:ilm_online_app/Views/home/home_decide.dart';
import 'package:ilm_online_app/Views/home/home_view.dart';
import 'package:ilm_online_app/Views/introScreen/splash_screen.dart';
import 'package:ilm_online_app/Views/notifications/notification_view.dart';
import 'package:ilm_online_app/Views/profile/profile_view.dart';

class MyApp extends StatefulWidget {
 const MyApp({
    Key? key,
  }) : super(key: key);

  // String userID;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // AuthUser _authUser=AuthUser();
  String? iD;
  isUserExist() async {
    _firebaseAuth.authStateChanges().listen(
      (user) {
        if (user != null) {
          setState(() {
            iD = user.uid;

            getUser(context);
            getNewSermon(context);
            getRecentSermon(context);
            getpopularSermon(context);
            getArticles(context);
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    isUserExist();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        title: '',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                elevation: 0,
                iconTheme: const IconThemeData(color: LIGHT_BLACK_COLOR),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor)),
        initialRoute: "/",
        routes: {
          "/": (context) => iD == null ? const SplashScreenVC() : HomeVC(),
          "/Home-Decide-Screen": (context) => const HomeDecideVC(),
          "/Sign-in-Screen": (context) => const SignInVC(),
          "/Sign-up-Screen": (context) => const SignUpVC(),
          "/Home-Screen": (context) => HomeVC(),
          "/Profile-Screen": (context) => const ProfileVC(),
          "/hadith-details": (context) => const HadithDetailsView(),
          "/video-player-view": (context) => const VideoPlayerView(),
          "/notification-screen": (context) => const NotificationsVC(),
        });
  }
}
