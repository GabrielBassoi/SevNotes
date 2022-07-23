import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sevnotes2/App/splash/splash_screen.dart';
import 'package:sevnotes2/data/data_to-do.dart';
import 'package:sevnotes2/data/theme_shared.dart';
import 'package:sevnotes2/stores/home_store.dart';
import 'package:sevnotes2/stores/todo_store.dart';

import 'App/home/home_note_screen.dart';
import 'data/data.dart';
import 'stores/settings_store.dart';

final HomeStore storeHome = GetIt.I<HomeStore>();
final TodoStore todoStore = GetIt.I<TodoStore>();
final SettingsStore setStore = GetIt.I<SettingsStore>();
final ThemeShared shared = ThemeShared();

void main() async {
  setupLocates();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  await ini();
}

void setupLocates() {
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(TodoStore());
  GetIt.I.registerSingleton(SettingsStore());
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
      initialRoute: "/splash",
      routes: {
        "/splash" : (context) => SplashScreen(),
        "/home" : (context) => HomeNoteScreen(),
      },
    );
  }
}

Future<void> ini() async {
  storeHome.setSearchText("");

  await Data().readData().then((value) {
    if (value != null) {
      storeHome.primaryList = value.asObservable();
    }
  });
  await DataTodo().readData().then((list) {
    todoStore.todoList = list.asObservable();
  });

  storeHome.search();
  
  await shared.loadTheme().then((value) => setStore.setThemeIndex(value!));
}
