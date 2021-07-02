import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sevnotes2/data/data_to-do.dart';
import 'package:sevnotes2/stores/home_store.dart';
import 'package:sevnotes2/stores/todo_store.dart';

import 'App/home/home_note_screen.dart';
import 'data/data.dart';

final HomeStore storeHome = GetIt.I<HomeStore>();
final TodoStore todoStore = GetIt.I<TodoStore>();
void main() async {
  setupLocates();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
  storeHome.setSearchText("");
  await ini();
}

void setupLocates() {
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(TodoStore());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

Future<void> ini() async {
  await Data().readData().then((value) {
    if (value != null) {
      storeHome.primaryList = value.asObservable();
    }
  });
  await DataTodo().readData().then((list) {
    if (list != null) {
      todoStore.todoList = list.asObservable();
    }
  });
  storeHome.search();
}
