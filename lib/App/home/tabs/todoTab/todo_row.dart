import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/data/data_to-do.dart';
import 'package:sevnotes2/models/todo.dart';
import 'package:sevnotes2/stores/todo_row_store.dart';
import 'package:sevnotes2/stores/todo_store.dart';

class TodoRow extends StatelessWidget {
  final TodoRowStore store = TodoRowStore();
  final TodoStore todoStore = GetIt.I<TodoStore>();

  TodoRow(this.td, this.index);
  final Todo td;
  final int index;

  @override
  Widget build(BuildContext context) {
    store.setData(td);
    store.setIndex(index);

    return Observer(builder: (_) {
      return Dismissible(
        direction: DismissDirection.startToEnd,
        background: Container(
          color: Colors.red,
        ),
        key: ValueKey(Todo),
        child: Container(
          height: 35,
          child: Row(
            children: [
              Checkbox(
                value: store.isCompleted,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: Colors.black,
                onChanged: (value) {
                  store.setCompleted(value);
                  store.saveData();
                  DataTodo().saveData(todoStore.todoList.toList());
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    style: GoogleFonts.roboto(),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your To-do",
                        hintStyle: GoogleFonts.roboto(
                            color: Colors.black45, fontSize: 13)),
                    initialValue: store.text,
                    onChanged: (e) {
                      store.setText(e);
                      store.saveData();
                      DataTodo().saveData(todoStore.todoList.toList());
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
