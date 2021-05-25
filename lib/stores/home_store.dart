import 'package:mobx/mobx.dart';
import 'package:sevnotes2/models/note.dart';

part 'home_store.g.dart';
//flutter packages pub run build_runner watch
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {

  ObservableList<Note> notesList = ObservableList<Note>();

}