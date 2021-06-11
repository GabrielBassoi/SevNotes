import 'dart:convert';
import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sevnotes2/models/note.dart';

part 'home_store.g.dart';

//flutter packages pub run build_runner watch
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  ObservableList<Note> notesList = ObservableList<Note>();

  @action
  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  @action
  Future<File> saveData() async {
    String data = json.encode(notesList);
    final file = await getFile();
    return file.writeAsString(data);
  }

  @action
  Future<String> readData() async {
    try {
      final file = await getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
