import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ilm_online_app/app.dart';
import 'package:ilm_online_app/firebase_options.dart';
import 'package:ilm_online_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
    final prefs = await SharedPreferences.getInstance();
    final userID = prefs.getString('user_id');
  runApp(
    ChangeNotifierProvider(
    create: (context) => UserProvider(),
    
    child:  MyApp(userID: userID,)));
}



