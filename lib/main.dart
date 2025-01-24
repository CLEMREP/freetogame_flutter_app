import 'package:boilerplate_alls_plateforms/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'pages/game_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FreeToGame',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomeScreen(),
    );
  }
}