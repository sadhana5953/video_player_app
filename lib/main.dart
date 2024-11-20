import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/View/Home_Page.dart';
import 'package:video_player_app/View/Splash_Screen.dart';

import 'View/View_Page.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlayerScreen(),
    );
  }
}
