import 'package:mobx/mobx.dart';
import 'package:sevnotes2/models/note.dart';

part 'edit_note_store.g.dart';

//flutter packages pub run build_runner watch
class EditNoteStore = _EditNoteStore with _$EditNoteStore;

abstract class _EditNoteStore with Store {
  @observable
  String title;

  @observable
  String body;

  @observable
  bool isFavorite;

  @observable
  String creationDate;

  @action
  void setData(Note note) {
    title = note.title;
    body = note.body;
    isFavorite = note.isFavorite;
    creationDate = note.creationDate;
  }

  @action
  void setTitle(String value) => title = value;

  @action
  void setBody(String value) => body = value;

  @action
  void setFavorite() => isFavorite = !isFavorite;
}
