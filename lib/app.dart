import 'package:flutter/material.dart';
import 'package:ilm_online_app/Views/authentication/sign_in_view.dart';
import 'package:ilm_online_app/Views/authentication/sign_up_view.dart';
import 'package:ilm_online_app/Views/home/home_decide.dart';
import 'package:ilm_online_app/Views/introScreen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(),
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreenVC(),
          "/Home-Decide-Screen": (context) => const HomeDecideVC(),
          "/Sign-in-Screen": (context) => const SignInVC(),
          "/Sign-up-Screen": (context) => const SignUpVC(),
        });
  }
}
