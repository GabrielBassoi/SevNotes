import 'package:flutter/material.dart';

class SettingsAppBar extends PreferredSize {
  final BuildContext context;
  SettingsAppBar(this.context)
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
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: Navigator.of(context).pop,
                  iconSize: 30,
                ),
              ),
            ),
            title: Text("Settings"),
            centerTitle: true,
          ),
        );
}
