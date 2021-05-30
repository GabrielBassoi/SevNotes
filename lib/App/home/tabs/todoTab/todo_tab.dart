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
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 10,
            color: Color.fromRGBO(100, 100, 100, 50),
          ),
        ]
      ),
      child: Observer(
        builder: (_) {
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: store.todoList.length + 1,
            itemBuilder: (context, index) {
              if(index == store.todoList.length) {
                return AddTodo();
              }
              return TodoRow(store.todoList[index]);
            },
          );
        },
      ),
    );
  }
}
