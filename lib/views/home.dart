import 'package:flutter/material.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/widgets/widget.dart';

import '../model/catagories_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CatagoriesModel> catagories = [];

  @override
  void initState() {
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
                    return CatagoryTile(title: catagories[index].catagoriesName, imgUrl: catagories[index].imgUrl);
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
      child: Stack(
        children: [
          Container(
            child: Image.network(imgUrl),
          ),
          Container(
            child: Text(title),
          ),
        ],
      ),
    );
  }
}
