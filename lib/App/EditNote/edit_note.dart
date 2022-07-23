import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/App/EditNote/widgets/date.dart';
import 'package:sevnotes2/App/EditNote/widgets/edit_note_appbar_widget.dart';
import 'package:sevnotes2/App/EditNote/widgets/edit_note_body_widget.dart';
import 'package:sevnotes2/models/note.dart';
import 'package:sevnotes2/stores/edit_note_store.dart';
import 'package:sevnotes2/stores/settings_store.dart';
import 'package:uuid/uuid.dart';

class EditNote extends StatelessWidget {
  final Note? note;
  final bool edit;
  final int index;
  EditNote({Key? key, this.note, this.edit = false, this.index = -1}) : super(key: key);

  final EditNoteStore store = EditNoteStore();
  final SettingsStore setStore = GetIt.I<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    if (edit == false) {
      store.setData(Note(title: "", body: "",isFavorite: false, creationDate: date(), id: const Uuid().v1()), edit);
    } else {
      store.setData(note!, edit);
    }
    if (index == -1) {
      return Scaffold(
        backgroundColor: setStore.theme.background,
        appBar: EditNoteAppBarWidget(store, context, setStore),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: EditNoteBodyWidget(store: store, setStore: setStore),
        ),
      );
    } else {
      return Hero(
        tag: index.toString(),
        child: Scaffold(
          backgroundColor: setStore.theme.background,
          appBar: EditNoteAppBarWidget(store, context, setStore),
          body: Container(
            padding: const EdgeInsets.all(15),
            child: EditNoteBodyWidget(store: store, setStore: setStore),
          ),
        ),
      );
    }
  }
}
