import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/models/todo.dart';
import 'package:sevnotes2/stores/home_store.dart';
import 'package:sevnotes2/stores/todo_store.dart';

import 'App/home/home_note_screen.dart';

void main() {
  setupLocates();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

void setupLocates() {
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(TodoStore());

  todoStore.todoList.add(todo("AMEM", false));
  todoStore.todoList.add(todo("AMEM AHSBFASBFJASFBJAS", true));
  todoStore.todoList.add(todo("AMEM sdjnf sdfku", false));
  todoStore.todoList.add(todo("AMEM asdasdasdas", true));
}

final HomeStore store = GetIt.I<HomeStore>();
final TodoStore todoStore = GetIt.I<TodoStore>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SevNotes 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey,
          fontFamily: "Roboto"
      ),
      home: HomeNoteScreen(),
    );
  }
}
