import 'package:flutter/material.dart';

import '../model/wallpaper_model.dart';

Widget brandname() {
  return Container(
    alignment: Alignment.center ,
    child: RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        children: const <TextSpan>[
          TextSpan(text: 'Wallpaper', style: TextStyle(color: Colors.black)),
          TextSpan(text: 'Hub', style: TextStyle(color: Colors.blue)),
        ],
      ),
    ),
  );
}

Widget wallpapersList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Container(
                child: Image.network(wallpaper.src.portrait, fit: BoxFit.cover),
              ),
            ));
      }).toList(),
    ),
  );
}
