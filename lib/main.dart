import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/data/data_to-do.dart';
import 'package:sevnotes2/stores/home_store.dart';
import 'package:sevnotes2/stores/search_store.dart';
import 'package:sevnotes2/stores/todo_store.dart';

import 'App/home/home_note_screen.dart';
import 'data/data.dart';

final HomeStore storeHome = GetIt.I<HomeStore>();
final TodoStore todoStore = GetIt.I<TodoStore>();
final SearchStore searchStore = GetIt.I<SearchStore>();
void main() async {
  setupLocates();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

void setupLocates() {
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(TodoStore());
  GetIt.I.registerSingleton(SearchStore());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    searchStore.setSearchText("");
    Data().readData().then((list) {
      if (list != null) {
        list.map((note) => storeHome.notesList.add(note)).toList();
      }
    });

    DataTodo().readData().then((list) {
      if (list != null) {
        list.map((todo) => todoStore.todoList.add(todo)).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SevNotes 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.grey, fontFamily: "Roboto"),
      home: HomeNoteScreen(),
    );
  }
}
