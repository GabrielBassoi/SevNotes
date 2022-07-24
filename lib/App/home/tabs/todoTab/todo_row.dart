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

  TodoRow(this.td, this.index, this.setStore, {Key? key}) : super(key: key);

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
        child: const Align(
            alignment: Alignment.centerLeft, child: Icon(Icons.delete)),
      ),
      onDismissed: (e) {
        todoStore.todoList.removeAt(index);
        DataTodo().saveData(todoStore.todoList.toList());
      },
      child: Observer(builder: (_) {
        return ListTile(
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 10,
          minVerticalPadding: 0,
          tileColor: setStore.theme.layout,
          leading: Theme(
            data: Theme.of(context).copyWith(unselectedWidgetColor: setStore.theme.background),
            child: Checkbox(
             value: store.isCompleted,
             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
             activeColor: setStore.theme.primary,
             checkColor: setStore.theme.background,
             onChanged: (value) {
               store.setCompleted(value!);
               store.saveData();
               DataTodo().saveData(todoStore.todoList.toList());
             },
            ),
           ),
          title: TextFormField(
            initialValue: store.text,
            maxLines: null,
            style: GoogleFonts.roboto(
              decoration:
              store.isCompleted ? TextDecoration.lineThrough : null,
              color: store.isCompleted
                  ? setStore.theme.text.withAlpha(200)
                  : setStore.theme.text,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: "Your To-do",
                hintStyle: GoogleFonts.roboto(
                    color: setStore.theme.text, fontSize: 13)
            ),
            onChanged: (e) {
              store.setText(e);
              store.saveData();
              DataTodo().saveData(todoStore.todoList.toList());
            },
          ),
          trailing: ReorderableDragStartListener(
            index: index,
            child: Icon(Icons.drag_handle, color: setStore.theme.primary,)
          ),
        );
      }),
    );
  }
}