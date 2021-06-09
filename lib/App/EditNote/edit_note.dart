import 'package:flutter/material.dart';
import 'package:sevnotes2/App/EditNote/widgets/date.dart';
import 'package:sevnotes2/App/EditNote/widgets/edit_note_appbar_widget.dart';
import 'package:sevnotes2/App/EditNote/widgets/edit_note_body_widget.dart';
import 'package:sevnotes2/models/note.dart';
import 'package:sevnotes2/stores/edit_note_store.dart';

class EditNote extends StatelessWidget {
  final Note note;
  EditNote({this.note});

  final EditNoteStore store = EditNoteStore();
  
  @override
  Widget build(BuildContext context) {
    if (note == null) {
      store.setData(Note("", "", false, date()));
    } else {
      store.setData(note);
    }
    return Container(
      child: Scaffold(
        appBar: EditNoteAppBarWidget(store: store),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: EditNoteBodyWidget(store: store),
        ),
      ),
    );
  }
}
