import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sevnotes2/App/EditNote/widgets/date.dart';
import 'package:sevnotes2/models/note.dart';
import 'package:sevnotes2/stores/home_store.dart';

part 'edit_note_store.g.dart';

//flutter packages pub run build_runner watch
class EditNoteStore = _EditNoteStore with _$EditNoteStore;

abstract class _EditNoteStore with Store {
  final HomeStore store = GetIt.I<HomeStore>();

  @observable
  int index;

  @observable
  String title;

  @observable
  String body;

  @observable
  bool isFavorite;

  @observable
  String creationDate;

  @action
  void setTitle(String value) => title = value;

  @action
  void setBody(String value) => body = value;

  @action
  void setFavorite() => isFavorite = !isFavorite;

  @action
  void setIndex(int value) => index = value;

  @action
  void setData(Note note) {
    title = note.title;
    body = note.body;
    isFavorite = note.isFavorite;
    creationDate = note.creationDate;
  }

  @action
  void addData() {
    store.notesList.add(Note(title, body, isFavorite, creationDate));
  }

  @action
  void saveData() {
    store.notesList[index].body = this.body;
    store.notesList[index].creationDate = date();
    store.notesList[index].title = this.title;
    store.notesList[index].isFavorite = this.isFavorite;
  }

  @action
  void deleteData() {
    store.notesList.removeAt(index);
  }
}
