import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/stores/settings_store.dart';

class SettingsAppBar extends PreferredSize {
  final BuildContext context;
  final SettingsStore setStore;
  SettingsAppBar(this.context, this.setStore)
      : super(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Hero(
              tag: "settings",
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  splashRadius: 20,
                  icon: Icon(Icons.keyboard_arrow_left, color: setStore.theme.primary,),
                  onPressed: Navigator.of(context).pop,
                  iconSize: 30,
                ),
              ),
            ),
            title: Text("Settings", style: GoogleFonts.roboto(color: setStore.theme.text)),
            centerTitle: true,
          ),
        );
}
