import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sevnotes2/models/note.dart';
import 'package:sevnotes2/stores/home_store.dart';

part 'edit_note_store.g.dart';

//flutter packages pub run build_runner watch
class EditNoteStore = _EditNoteStore with _$EditNoteStore;

abstract class _EditNoteStore with Store {
  final HomeStore store = GetIt.I<HomeStore>();

  @observable
  String id;

  @observable
  String title;

  @observable
  String body;

  @observable
  bool isFavorite;

  @observable
  bool edit;

  @observable
  String creationDate;

  @action
  void setTitle(String value) => title = value;

  @action
  void setBody(String value) => body = value;

  @action
  void setFavorite() => isFavorite = !isFavorite;

  @action
  void setData(Note note, bool e) {
    edit = e;
    id = note.id;
    title = note.title;
    body = note.body;
    isFavorite = note.isFavorite;
    creationDate = note.creationDate;
  }

  @action
  void addData() {
    store.primaryList.add(Note(
      title: title,
      body: body,
      isFavorite: isFavorite,
      creationDate: creationDate,
      id: id,
    ));
  }

  @action
  void saveData() {
    store.primaryList[index()] = Note(
      title: title,
      body: body,
      isFavorite: isFavorite,
      creationDate: creationDate,
      id: id,
    );
  }

  @action
  void deleteData() {
    store.primaryList.removeAt(index());
  }

  @action
  int index() {
    int i = store.primaryList.indexWhere((element) {
      if (element.id == id) {
        return true;
      }
      return false;
    }).toInt();
    print("------------- $i --------------------");
    return i;
  }
}
