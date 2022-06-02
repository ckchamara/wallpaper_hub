import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/widgets/widget.dart';
import 'package:http/http.dart' as http;
import '../model/catagories_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CatagoriesModel> catagories = [];


  getTrendingWallpapers() async {
    var response =  await http.get(
      Uri.parse('https://api.pexels.com/v1/curated?per_page=1'),
      headers: {
        HttpHeaders.authorizationHeader: '563492ad6f917000010000012c0052627ec94545a4f01fff5e520e97',
      },
    );
    // print(response.body.toString());
    Map<String,dynamic> jsonData =  jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      
    });
  }


  @override
  void initState() {
    getTrendingWallpapers();
    catagories = getCatagories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandname(),
        elevation: 0.0,
      ),
      body: Container(
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
                      decoration: InputDecoration(
                          hintText: "Search", border: InputBorder.none),
                    ),
                  ),
                  Icon(Icons.search)
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 80,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: catagories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CatagoryTile(
                        title: catagories[index].catagoriesName,
                        imgUrl: catagories[index].imgUrl);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CatagoryTile extends StatelessWidget {
  String imgUrl = "";
  String title = "";

  CatagoryTile({Key? key, required this.imgUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imgUrl,
              height: 50,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 50,
            width: 100,
            color: Colors.black26,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
