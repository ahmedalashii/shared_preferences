// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app/prefernces/app_preferences.dart';

import 'screens/main_screen.dart';

void main() async {
  // You only need to call this method if you need the binding to be initialized before calling [runApp].
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : MainScreen(),
    );
  }
}
