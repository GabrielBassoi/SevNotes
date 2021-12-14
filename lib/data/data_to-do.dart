import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sevnotes2/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataTodo {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<SharedPreferences> getFile() async {
    SharedPreferences prefs = await _prefs;
    return prefs;
  }

  Future saveData(List<Todo> list) async {
    try {
      List data = list.map((todo) => todo.toJson()).toList();
      final file = await getFile();
      await file.setStringList("todo-list", data);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Todo>> readData() async {
    try {
      final file = await getFile();
      var data = await file.getStringList("todo-list");
      List<Todo> list = data.map<Todo>((todo) => Todo.fromJson(todo)).toList();
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }
}

// Antigo

// Future<File> getFile() async {
//     final dic = await getApplicationDocumentsDirectory();
//     return File("${dic.path}/data_to-do.json");
//   }

//   Future saveData(List<Todo> list) async {
//     List listJSON = list.map((todo) => todo.toJson()).toList();
//     var data = json.encode(listJSON);
//     final file = await getFile();
//     file.writeAsString(data);
//   }

//   Future<List<Todo>> readData() async {
//     try {
//       final file = await getFile();
//       var data = json.decode(await file.readAsString());
//       List<Todo> list = data.map<Todo>((todo) => Todo.fromJson(todo)).toList();
//       return list;
//     } catch (e) {
//       print(e);
//       return [];
//     }
//   }
