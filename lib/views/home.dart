import 'package:flutter/material.dart';
import 'package:wallpaper_hub/widgets/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Brandname(),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search"
                      ),
                    ),
                  ),
                  Icon(Icons.search)
                ],
              )
          ],
        ),
      ),
    );
  }
}
