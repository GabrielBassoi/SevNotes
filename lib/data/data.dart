import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sevnotes2/models/note.dart';

class Data {
  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future saveData(List<Note> list) async {
    List jsonList = [];
    list.map((note) => jsonList.add(note.toJson())).toString();
    String data = json.encode(jsonList);
    final file = await getFile();
    file.writeAsString(data);
  }

  Future<List> readData() async {
    try {
      final file = await getFile();
      List<Note> list = (jsonDecode(await file.readAsString()) as List)
          .map((note) => Note.fromJson(note))
          .toList();
      return list;
    } catch (e) {
      return null;
    }
  }
}
