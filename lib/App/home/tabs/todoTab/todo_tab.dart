import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/stores/settings_store.dart';
import 'package:sevnotes2/stores/todo_store.dart';

import '../../../../data/data_to-do.dart';
import '../../../../models/todo.dart';
import 'add_todo.dart';
import 'todo_row.dart';

class TodoTab extends StatelessWidget {
  final TodoStore store = GetIt.I<TodoStore>();
  final SettingsStore setStore = GetIt.I<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: setStore.theme.layout,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Observer(
              builder: (_) {
                return ReorderableListView.builder(
                  buildDefaultDragHandles: false,
                  padding: const EdgeInsets.all(10),
                  footer: AddTodo(setStore),
                  itemCount: store.todoList.length,
                  shrinkWrap: true,
                  onReorder: (oldIndex, newIndex){
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final Todo item = store.todoList.removeAt(oldIndex);
                    store.todoList.insert(newIndex, item);
                    DataTodo().saveData(store.todoList.toList());
                  },
                  itemBuilder: (context, index) {
                    return AnimatedCard(
                      key: Key("$index"),
                      direction: AnimatedCardDirection.left,
                      initDelay: Duration(milliseconds: index*80),
                      child: TodoRow(store.todoList[index], index, setStore),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

// ListView.builder(
//   shrinkWrap: true,
//   padding: const EdgeInsets.all(10),
//   itemCount: store.todoList.length + 1,
//   itemBuilder: (context, index) {
//     if (index == store.todoList.length) {
//       return AddTodo(setStore);
//     }
//     return AnimatedCard(
//       direction: AnimatedCardDirection.left,
//       initDelay: Duration(milliseconds: index * 80),
//       child: TodoRow(store.todoList[index], index, setStore),
//     );
//   },
// );