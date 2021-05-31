import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/App/home/tabs/empty_list.dart';
import 'package:sevnotes2/App/home/widgets/note_card.dart';
import 'package:sevnotes2/models/todo.dart';
import 'package:sevnotes2/stores/home_store.dart';

class WhitelistTab extends StatelessWidget {
  final HomeStore store = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    SliverGridDelegateWithFixedCrossAxisCount gridDelegate =
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);

    int i = 0;
    for (final e in store.notesList) {
      if (e.isFavorite) {
        i += 1;
      }
    }

    return Observer(builder: (_) {
      if (i == 0) {
        return EmptyList(
            title: "Where is my favorites notes????",
            subTitle:
                "Go to some note and click on the Star to add your first favorite note",
            icons: Icons.favorite_border);
      }
      return Container(
        child: GridView.builder(
          gridDelegate: gridDelegate,
          itemCount: i,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(13),
              child: NoteCard(store.notesList[index]),
            );
          },
        ),
      );
    });
  }
}
