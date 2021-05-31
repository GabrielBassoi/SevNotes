import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/models/todo.dart';
import 'package:sevnotes2/stores/home_store.dart';
import 'package:sevnotes2/stores/todo_store.dart';

import 'App/home/home_note_screen.dart';
import 'models/note.dart';

void main() {
  setupLocates();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

final DateTime time = DateTime.now();

// Months oi

List<String> month = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "June",
  "July",
  "Aug",
  "Sept",
  "Oct",
  "Nov",
  "Dec",
];

void setupLocates() {
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(TodoStore());
  //store.notesList.add(Note("Bom dia", "TTTTTTTTTTTTTTTTTTTT", false, "${month[(time.month)-1]} ${time.day}, ${time.year}"));
  // store.notesList.add(Note("Bom digddfgdfgda", "TTTTTTTTTdfgdgTTTTTTTTTdfgdfgdfTTTTTTTT", true, "${month[(time.month)-1]} ${time.day}, ${time.year}"));
  // store.notesList.add(Note("Bom ddfgdfgdgia", "TTTTTTTTTTTTTTTTTTTTTTytyergdgdfTTTT", false, "${month[(time.month)-1]} ${time.day}, ${time.year}"));
  // store.notesList.add(Note("Bdfgdfdfgdom dia", "TTTTTTTTTTTTTTTTTTTfgdgdfdfgdgTTTTTT", false, "${month[(time.month)-1]} ${time.day}, ${time.year}"));

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
