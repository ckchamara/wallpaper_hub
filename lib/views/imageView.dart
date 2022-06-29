import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class imageView extends StatefulWidget {
  final String imageUrl;

  const imageView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<imageView> createState() => _imageViewState();
}

class _imageViewState extends State<imageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              )),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
            onTap: () => Navigator.pop(context),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 51,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black.withOpacity(0.8)),
                      ),
                      Container(
                          height: 51,
                          width: MediaQuery.of(context).size.width / 2,
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white54, width: 1),
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(colors: [
                                Color(0x36FFFFFF),
                                Color(0x3FFFFFFF)
                              ])),
                          child: Column(
                            children: const [
                              Text("Set Wallpaper",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white70)),
                              Text(
                                "Image will be saved in gallery",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white70),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // _save() async {
  //    await _askPermission();
  //    var responce = await Dio().get(
  //      widget.imgPath,
  //      options: Options(responseType: ResponseType.bytes)
  //    );
  //    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(responce.data));
  //    print(result);
  //    Navigator.pop(context);
  // }
  //
  // askPermission() async {
  //   if (Platform.isIOS) {
  //     Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions(
  //       [PermissionGroup.photos]
  //     );
  //   }else {
  //     PermissionStatus permissions = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
  //   }
  // }



  _save() async {
    // await _askPermission();
    var response = await Dio().get(widget.imageUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  // _askPermission() async {
  //   if (Platform.isIOS) {
  //     Map<PermissionGroup, PermissionStatus> permissions =
  //         await PermissionHandler()
  //         .requestPermissions([PermissionGroup.photos]);
  //   } else {
  //     PermissionStatus permission = await PermissionHandler()
  //         .checkPermissionStatus(PermissionGroup.storage);
  //   }
  // }
}

