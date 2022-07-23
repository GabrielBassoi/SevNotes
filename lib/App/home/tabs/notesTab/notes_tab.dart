import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/App/home/widgets/note_card.dart';
import 'package:sevnotes2/stores/home_store.dart';
import 'package:sevnotes2/stores/settings_store.dart';
import '../empty_list.dart';

class NotesTab extends StatelessWidget {
  final HomeStore store = GetIt.I<HomeStore>();
  final SettingsStore setStore = GetIt.I<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    SliverGridDelegateWithFixedCrossAxisCount gridDelegate =
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);

    return Observer(
      builder: (context) {
        if (store.notesList.isEmpty && store.searchText!.isEmpty) {
          return EmptyList(
            title: "Where is my notes???",
            subTitle: "Click on the add button to add your first note!",
            icons: Icons.help_outline,
          );
        } else if (store.searchText!.isNotEmpty && store.notesList.isEmpty) {
          return EmptyList(
            title: "I didn't find anything!",
            subTitle: "Try to put something different",
            icons: Icons.search,
          );
        } else {
          return Observer(
            builder: (_) {
              return GridView.builder(
                //reverse: true,
                gridDelegate: gridDelegate,
                itemCount: store.notesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimatedCard(
                    direction: index.isOdd
                        ? AnimatedCardDirection.right
                        : AnimatedCardDirection.left,
                    child: Container(
                      margin: const EdgeInsets.all(13),
                      child: NoteCard(store.notesList[index], setStore, index),
                    ),
                  );
                },
              );
            }
          );
        }
      },
    );
  }
}
