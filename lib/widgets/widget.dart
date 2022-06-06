import 'package:flutter/material.dart';

import '../model/wallpaper_model.dart';

Widget brandname() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black87),
      ),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue),
      )
    ],
  );
}


Widget WallpapersList({List<WallpaperModel> wallpapers, Conte}){
  return Container(
    child: GridView.count(crossAxisCount: null),
  );
}
