import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/stores/todo_store.dart';

import 'add_todo.dart';
import 'todo_row.dart';

class TodoTab extends StatelessWidget {
  final TodoStore store = GetIt.I<TodoStore>();

  @override
  Widget build(BuildContext context) {
    return Flexible(
          child: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey,
          ),
          child: Observer(
              builder: (_) {
                return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: store.todoList.length + 1,
          itemBuilder: (context, index) {
            if (index == store.todoList.length) {
              return AddTodo();
            }
            return TodoRow(store.todoList[index]);
          },
                );
              },
            ),
          ),
        ),
    );
  }
}
