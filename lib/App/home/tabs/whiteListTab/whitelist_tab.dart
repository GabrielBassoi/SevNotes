import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/App/home/tabs/empty_list.dart';
import 'package:sevnotes2/App/home/widgets/note_card.dart';
import 'package:sevnotes2/stores/home_store.dart';
import 'package:sevnotes2/stores/settings_store.dart';

class WhitelistTab extends StatelessWidget {
  final HomeStore store = GetIt.I<HomeStore>();
  final SettingsStore setStore = GetIt.I<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    SliverGridDelegateWithFixedCrossAxisCount gridDelegate =
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);

    return Observer(builder: (_) {
      List ind = [];
      int i = 0;
      for (int e = 0; e < store.notesList.length; e++) {
        if (store.notesList[e].isFavorite == true) {
          i += 1;
          ind.add(e);
        }
      }
      if (i == 0 && store.searchText!.isEmpty) {
        return EmptyList(
            title: "Where is my favorites notes????",
            subTitle:
                "Go to some note and click on the star to add your first favorite note",
            icons: Icons.favorite_border);
      } else if (store.searchText!.isNotEmpty && store.notesList.isEmpty) {
        return EmptyList(
          title: "I didn't find anything!",
          subTitle: "Try to put something different",
          icons: Icons.search,
        );
      } else {
        return Container(
          child: GridView.builder(
            gridDelegate: gridDelegate,
            itemCount: i,
            itemBuilder: (BuildContext context, int index) {
              return AnimatedCard(
                direction: index.isOdd
                    ? AnimatedCardDirection.right
                    : AnimatedCardDirection.left,
                child: Container(
                  margin: const EdgeInsets.all(13),
                  child: NoteCard(
                    store.notesList[ind[index]],
                    setStore,
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
