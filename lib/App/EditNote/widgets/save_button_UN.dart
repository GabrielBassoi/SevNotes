import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sevnotes2/stores/settings_store.dart';

class SaveButton extends StatelessWidget {
  final String title;
  final String body;
  SettingsStore store = GetIt.I<SettingsStore>();

  SaveButton({required this.title, required this.body});

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
      icon: Icon(Icons.save_alt, color: store.theme.primary),
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
