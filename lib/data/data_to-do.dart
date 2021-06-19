import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sevnotes2/models/todo.dart';

class DataTodo {
  Future<File> getFile() async {
    final dic = await getApplicationDocumentsDirectory();
    return File("${dic.path}/data_to-do.json");
  }

  Future saveData(List<Todo> list) async {
    List listJSON = list.map((todo) => todo.toJson()).toList();
    var data = json.encode(listJSON);
    final file = await getFile();
    file.writeAsString(data);
  }

  Future<List> readData() async {
    try {
      final file = await getFile();
      var data = json.decode(await file.readAsString());
      List list = data.map((todo) => Todo.fromJson(todo)).toList();
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
