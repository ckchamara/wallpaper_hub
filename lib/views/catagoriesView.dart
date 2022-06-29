import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/wallpaper_model.dart';
import '../widgets/widget.dart';

class CatagoriesView extends StatefulWidget {
  final String catagoryName;
  const CatagoriesView({Key? key, required this.catagoryName}) : super(key: key);

  @override
  State<CatagoriesView> createState() => _CatagoriesViewState();
}

class _CatagoriesViewState extends State<CatagoriesView> {

  List<WallpaperModel> wallpapers = [];

  getSearchWallpapers(String query) async {
    var response = await http.get(
      Uri.parse('https://api.pexels.com/v1/search?query=$query'),
      headers: {
        HttpHeaders.authorizationHeader:
        '563492ad6f917000010000012c0052627ec94545a4f01fff5e520e97',
      },
    );
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      // WallpaperModel wallpaperModel = new WallpaperModel();
      WallpaperModel wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.catagoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandname(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}

