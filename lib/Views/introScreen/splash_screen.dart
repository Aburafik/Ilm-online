import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ilm_online_app/Components/utils/color_theme.dart';

class SplashScreenVC extends StatefulWidget {
  const SplashScreenVC({Key? key}) : super(key: key);

  @override
  State<SplashScreenVC> createState() => _SplashScreenVCState();
}

class _SplashScreenVCState extends State<SplashScreenVC> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, '/Home-Decide-Screen', (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 50,
          backgroundColor: PRIMARY_COLOR,
          child: Text(
            "ILM \nOnline",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
