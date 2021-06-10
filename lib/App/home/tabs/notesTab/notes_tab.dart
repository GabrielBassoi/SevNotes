import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/App/home/widgets/note_card.dart';
import 'package:sevnotes2/stores/home_store.dart';

import '../empty_list.dart';

class NotesTab extends StatelessWidget {
  NotesTab({Key key}) : super(key: key);

  final HomeStore store = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    SliverGridDelegateWithFixedCrossAxisCount gridDelegate =
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);
    return Observer(builder: (_) {
      if (store.notesList.isEmpty) {
        return EmptyList(title: "Where is my notes???", subTitle: "Click on the add button to add your first note!", icons: Icons.help_outline,);
      } else {
        return GridView.builder(
            gridDelegate: gridDelegate,
            itemCount: store.notesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: const EdgeInsets.all(13),
                  child: NoteCard(store.notesList[index], index));
            });
      }
    });
  }
}
