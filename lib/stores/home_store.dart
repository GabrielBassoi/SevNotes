import 'package:mobx/mobx.dart';
import 'package:sevnotes2/models/note.dart';

import '../data/data.dart';

part 'home_store.g.dart';

//flutter packages pub run build_runner watch
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {

  @observable
  int? tabIndex;

  @observable
  bool? folded;

  @observable
  String? searchText;

  @observable
  ObservableList<Note> primaryList = ObservableList<Note>();

  @observable
  ObservableList<Note> notesList = ObservableList<Note>();

  @action
  void setTabIndex(int value) => tabIndex = value;

  @action
  void setFolded() => folded = !folded!;

  @action
  void setSearchText(String value) => searchText = value;

  @action
  setPrimaryObject(Note note, int index) => primaryList[index] = note;
  @action
  setPrimaryList(List<Note> list) => primaryList = list.asObservable();
  @action
  void rm(int i) {
    primaryList.removeAt(i);
    saveData();
    search();
  }

  @action
  setNotesObject(Note note, int index) => notesList[index] = note;
  @action
  setNotesList(List<Note> list) => notesList = list.asObservable();

  @action
  void search() {
    if (searchText == "" || searchText!.isEmpty) {
      setNotesList(primaryList);
    } else {
      List<Note> l = primaryList
          .where((note) =>
      note.title.toLowerCase().contains(searchText!.toLowerCase()) ||
          note.body.toLowerCase().contains(searchText!.toLowerCase()))
          .toList();
      setNotesList(l);
    }
  }

  @action
  void saveData() {
    Data().saveData(primaryList.toList());
    search();
  }
}
