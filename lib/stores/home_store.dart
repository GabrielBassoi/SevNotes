import 'package:mobx/mobx.dart';
import 'package:sevnotes2/models/note.dart';

part 'home_store.g.dart';

//flutter packages pub run build_runner watch
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  int tabIndex;

  ObservableList<Note> notesList = ObservableList<Note>();

  @action
  void setNotesList(ObservableList value) => notesList = value;

  @action
  void setTabIndex(int value) => tabIndex = value;
}
