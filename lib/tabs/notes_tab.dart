import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/stores/home_store.dart';
import 'package:sevnotes2/widgets/notes/note_card.dart';

class NotesTab extends StatelessWidget {

  final HomeStore store = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {

    SliverGridDelegateWithFixedCrossAxisCount gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);

    return Container(
      child: Observer(
        builder: (_) {
          return GridView.builder(
            gridDelegate: gridDelegate,
            itemCount: store.notesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: const EdgeInsets.all(13),
                  child: NoteCard(store.notesList[index])
              );
            },
          );
        }
      ),
    );
  }
}
