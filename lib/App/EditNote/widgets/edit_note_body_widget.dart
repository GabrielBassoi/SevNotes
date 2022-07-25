import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/stores/edit_note_store.dart';
import 'package:sevnotes2/stores/settings_store.dart';

class EditNoteBodyWidget extends StatelessWidget {
  final EditNoteStore store;
  final SettingsStore setStore;
  const EditNoteBodyWidget({required this.store, required this.setStore});

  Widget form(newV, initV, hint,{maxL = null, maxLines = null}) {
    return TextFormField(
      onChanged: newV,
      initialValue: initV,
      maxLines: maxLines,
      maxLength: maxL,
      style: GoogleFonts.roboto(color: setStore.theme.text),
      decoration: InputDecoration(
        border: InputBorder.none,
        counterText: "",
        hintText: hint,
        hintStyle: GoogleFonts.roboto(
            color: setStore.theme.text.withAlpha(860)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 15, left: 15),
            decoration: BoxDecoration(
              color: setStore.theme.layout,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Observer(builder: (_) {
              return AnimatedCard(
                direction: AnimatedCardDirection.left,
                initDelay: const Duration(milliseconds: 800),
                child: form(store.setTitle, store.title, "Title", maxL: 50, maxLines: 1),
              );
            }),
          ),
          const SizedBox(height: 15,),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                color: setStore.theme.layout,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  initDelay: const Duration(milliseconds: 850),
                  child: form(store.setBody, store.body, "Text"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}