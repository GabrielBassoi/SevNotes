import 'package:mobx/mobx.dart';
import 'package:sevnotes2/models/todo.dart';

part 'todo_store.g.dart';
//flutter packages pub run build_runner watch
class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {

  ObservableList<Todo> todoList = ObservableList<Todo>();

}
