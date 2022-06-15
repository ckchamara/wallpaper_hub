import 'package:flutter/material.dart';
import 'package:wallpaper_hub/views/homeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WallpaperHub',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: HomeView(),
    );
  }
}
