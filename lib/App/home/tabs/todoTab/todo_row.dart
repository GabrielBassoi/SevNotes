import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/data/data_to-do.dart';
import 'package:sevnotes2/models/todo.dart';
import 'package:sevnotes2/stores/settings_store.dart';
import 'package:sevnotes2/stores/todo_row_store.dart';
import 'package:sevnotes2/stores/todo_store.dart';

class TodoRow extends StatelessWidget {
  final TodoRowStore store = TodoRowStore();
  final TodoStore todoStore = GetIt.I<TodoStore>();
  final SettingsStore setStore;

  TodoRow(this.td, this.index, this.setStore);
  final Todo td;
  final int index;

  @override
  Widget build(BuildContext context) {
    store.setData(td);
    store.setIndex(index);

    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: ValueKey(td),
      background: Container(
        padding: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
        ),
        child:
            Align(alignment: Alignment.centerLeft, child: Icon(Icons.delete)),
      ),
      onDismissed: (e) {
        todoStore.todoList.removeAt(index);
        DataTodo().saveData(todoStore.todoList.toList());
      },
      child: Observer(builder: (_) {
        return Container(
          height: 35,
          child: Row(
            children: [
              Theme(
                data: Theme.of(context).copyWith(unselectedWidgetColor: setStore.theme.background),
                child: Checkbox(
                  value: store.isCompleted,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: setStore.theme.primary,
                  checkColor: setStore.theme.background,
                  onChanged: (value) {
                    store.setCompleted(value);
                    store.saveData();
                    DataTodo().saveData(todoStore.todoList.toList());
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    style: GoogleFonts.roboto(
                      decoration:
                          store.isCompleted ? TextDecoration.lineThrough : null,
                      color: store.isCompleted
                          ? setStore.theme.text.withAlpha(200)
                          : setStore.theme.text,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your To-do",
                        hintStyle: GoogleFonts.roboto(
                            color: setStore.theme.text, fontSize: 13)),
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
        );
      }),
    );
  }
}
