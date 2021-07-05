import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/stores/edit_note_store.dart';
import 'package:sevnotes2/stores/settings_store.dart';

Future showDialogWidget(BuildContext context, EditNoteStore store) async {
  final SettingsStore setStore = GetIt.I<SettingsStore>();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: setStore.theme.layout,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            "Do you like to delete this note?",
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold, color: setStore.theme.text),
          ),
          actions: [
            TextButton(
              onPressed: () {
                store.deleteData();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text(
                "Yes",
                style: GoogleFonts.roboto(color: setStore.theme.text, fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text(
                "Noooo",
                style: GoogleFonts.roboto(color: setStore.theme.text, fontSize: 16),
              ),
            ),
          ],
        );
      });
}
