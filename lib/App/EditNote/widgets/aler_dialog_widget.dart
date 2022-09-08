import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/stores/edit_note_store.dart';
import 'package:sevnotes2/stores/settings_store.dart';

Future showDialogWidget(BuildContext context, EditNoteStore store) async {
  final SettingsStore setStore = GetIt.I<SettingsStore>();

   Widget buttonText(String text) {
     return Text(
       text,
       style: GoogleFonts.roboto(color: setStore.theme.text, fontSize: 16),
     );
   }

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        backgroundColor: setStore.theme.layout,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: AnimatedCard(
          direction: AnimatedCardDirection.top,
          child: Text("Do you like to delete this note?",
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, color: setStore.theme.text),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              store.setDeleted();
              store.deleteData();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: buttonText("Yes")
          ),
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: buttonText("No")
          ),
        ],
      );
    }
  );
}
