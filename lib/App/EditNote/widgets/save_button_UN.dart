import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SaveButton extends StatelessWidget {
  final String title;
  final String body;

  const SaveButton({required Key key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      onPressed: () {
        requestPermission();
        makeFile(title, body);
      },
      iconSize: 25,
      splashRadius: 20,
      icon: Icon(Icons.save_alt),
    );
  }
}

Future<void> requestPermission() async{
  if(await Permission.storage.request().isDenied) {
    await Permission.storage.request();
  }
}

Future<void> makeFile(String title, String body) async {
  String path = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOWNLOADS);
  String filePath = "$path/$title.txt";

  File file = File(filePath);
  file.writeAsString("$title");
  file.writeAsString("$body");
}
