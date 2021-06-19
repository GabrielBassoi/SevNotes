import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/models/todo.dart';
import 'package:sevnotes2/stores/todo_row_store.dart';

class TodoRow extends StatelessWidget {
  final TodoRowStore store = TodoRowStore();
  TodoRow(this.td);
  final Todo td;

  @override
  Widget build(BuildContext context) {

    store.setData(td);

    return Observer(
      builder: (_) {
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
                        hintStyle: GoogleFonts.roboto(color: Colors.black45, fontSize: 13)
                      ),
                      initialValue: store.text,
                      onChanged: store.setText,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

