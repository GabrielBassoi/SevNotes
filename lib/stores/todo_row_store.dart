import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sevnotes2/models/todo.dart';

import 'todo_store.dart';

part 'todo_row_store.g.dart';

//flutter packages pub run build_runner watch
class TodoRowStore = _TodoRowStore with _$TodoRowStore;

abstract class _TodoRowStore with Store {
  final TodoStore store = GetIt.I<TodoStore>();

  @observable
  bool isCompleted;

  @observable
  String text;

  @observable
  int index;

  @action
  void setData(Todo todo) {
    text = todo.title;
    isCompleted = todo.checked;
  }

  @action
  void saveData() {
    store.todoList[index].title = text;
    store.todoList[index].checked = isCompleted;
  }

  @action
  void setIndex(int value) => index = value;

  @action
  void setText(String value) => text = value;

  @action
  void setCompleted(bool value) => isCompleted = value;
}
