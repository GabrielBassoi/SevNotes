import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/App/EditNote/widgets/date.dart';
import 'package:sevnotes2/App/EditNote/widgets/edit_note_appbar_widget.dart';
import 'package:sevnotes2/App/EditNote/widgets/edit_note_body_widget.dart';
import 'package:sevnotes2/models/note.dart';
import 'package:sevnotes2/stores/edit_note_store.dart';
import 'package:sevnotes2/stores/home_store.dart';
import 'package:sevnotes2/stores/settings_store.dart';
import 'package:uuid/uuid.dart';

class EditNote extends StatefulWidget {
  final Note? note;
  final bool edit;
  final int index;

  EditNote({Key? key, this.note, this.edit = false, this.index = -1}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final EditNoteStore store = EditNoteStore();
  final SettingsStore setStore = GetIt.I<SettingsStore>();
  final HomeStore homeStore = GetIt.I<HomeStore>();

  void startData() {
    if (widget.edit == false) {
      store.setData(Note(title: "", body: "",isFavorite: false, creationDate: date(), id: const Uuid().v1()), widget.edit);
    } else {
      store.setData(widget.note!, widget.edit);
    }
  }

  Widget editNoteTab(context) {
    return Scaffold(
      backgroundColor: setStore.theme.background,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: EditNoteAppBarWidget(store: store, context: context, setStore: setStore,)
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: EditNoteBodyWidget(store: store, setStore: setStore),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    startData();

    if (widget.index == -1) {
      return editNoteTab(context);
    } else {
      return Hero(
        tag: widget.index.toString(),
        child: editNoteTab(context),
      );
    }
  }

  @override
  void dispose() {
    if (!store.deleted) {
      if (!store.edit) {
        store.addData();
      } else {
        store.saveData();
      }
      homeStore.saveData();
    }
    super.dispose();
  }
}
