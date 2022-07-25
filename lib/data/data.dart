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
    List listJSON = list.map((note) => note.toJson()).toList();
    var data = json.encode(listJSON);
    final file = await getFile();
    file.writeAsString(data);
  }

  Future<List<Note>?> readData() async {
    try {
      final file = await getFile();
      var data = json.decode(await file.readAsString());
      List<Note> list = data.map<Note>((note) => Note.fromJson(note)).toList();
      return list;
    } catch (e) {
      return null;
    }
  }
}
