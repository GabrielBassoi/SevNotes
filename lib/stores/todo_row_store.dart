import 'package:mobx/mobx.dart';
import 'package:sevnotes2/models/todo.dart';

part 'todo_row_store.g.dart';
//flutter packages pub run build_runner watch
class TodoRowStore = _TodoRowStore with _$TodoRowStore;

abstract class _TodoRowStore with Store {

  @observable
  bool isCompleted;

  @observable
  String text;

  @action
  void setData(Todo todo) {
    text = todo.title;
    isCompleted = todo.checked;
  }

  @action
  void setText(String value) => text = value;

  @action
  void setCompleted(bool value) => isCompleted = value;

}
