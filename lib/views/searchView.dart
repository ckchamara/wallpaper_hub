import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/wallpaper_model.dart';
import '../widgets/widget.dart';

class SearchView extends StatefulWidget {
  final String searchQuery;

  const SearchView({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = new TextEditingController();
  List<WallpaperModel> wallpapers = [];


  getSearchWallpapers(String query) async {
    var response = await http.get(
      Uri.parse('https://api.pexels.com/v1/search?query=$query'),
      //"https://api.pexels.com/v1/search?query=nature&per_page=1"
      headers: {
        HttpHeaders.authorizationHeader:
        '563492ad6f917000010000012c0052627ec94545a4f01fff5e520e97',
      },
    );
    // print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      // WallpaperModel wallpaperModel = new WallpaperModel();
      WallpaperModel wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {

    });
  }

  @override
  void initState() {
    getSearchWallpapers(widget.searchQuery);
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
              Container(
                decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "Search", border: InputBorder.none),
                      ),
                    ),
                    InkWell(
                        onTap: () {}, child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
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
