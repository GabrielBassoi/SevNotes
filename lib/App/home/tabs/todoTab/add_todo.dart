import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/models/todo.dart';
import 'package:sevnotes2/stores/todo_store.dart';

class AddTodo extends StatelessWidget {

  final TodoStore store = GetIt.I<TodoStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        store.todoList.add(Todo("", false));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Icon(Icons.add, size: 30, color: Colors.black,),
            SizedBox(width: 8,),
            Text("Add a new Todo", style: GoogleFonts.roboto(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
