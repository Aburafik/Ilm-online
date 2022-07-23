import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';
import 'package:ilm_online_app/Views/authentication/sign_in_view.dart';
import 'package:ilm_online_app/Views/authentication/sign_up_view.dart';
import 'package:ilm_online_app/Views/home/home_decide.dart';
import 'package:ilm_online_app/Views/home/home_view.dart';
import 'package:ilm_online_app/Views/introScreen/splash_screen.dart';
import 'package:ilm_online_app/Views/profile/profile_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
          "/": (context) => const SplashScreenVC(),
          "/Home-Decide-Screen": (context) => const HomeDecideVC(),
          "/Sign-in-Screen": (context) => const SignInVC(),
          "/Sign-up-Screen": (context) => const SignUpVC(),
          "/Home-Screen": (context) => HomeVC(),
          "/Profile-Screen": (context) => ProfileVC(),
        });
  }
}


