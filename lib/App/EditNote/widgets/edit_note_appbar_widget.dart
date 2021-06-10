import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/stores/edit_note_store.dart';

class EditNoteAppBarWidget extends PreferredSize {
  final EditNoteStore store;
  final BuildContext context;

  EditNoteAppBarWidget(this.store, this.context)
      : super(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            toolbarHeight: 65,
            elevation: 15,
            shadowColor: Color.fromRGBO(100, 100, 100, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            title: Observer(builder: (_) {
              return Text("${store.creationDate}",
                  style: GoogleFonts.roboto(
                      fontSize: 15, color: Color.fromRGBO(93, 93, 93, 100)));
            }),
            leading: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                if (store.index == null) {
                  store.addData();
                } else {
                  store.saveData();
                }
                Navigator.of(context).pop();
              },
              splashRadius: 20,
              iconSize: 25,
              icon: Icon(Icons.keyboard_arrow_left),
            ),
            actions: [
              Observer(builder: (_) {
                return IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  splashRadius: 20,
                  onPressed: store.setFavorite,
                  iconSize: 25,
                  icon: store.isFavorite
                      ? Icon(Icons.star)
                      : Icon(Icons.star_border),
                );
              }),
              SizedBox(width: 11),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                splashRadius: 20,
                onPressed: () {},
                iconSize: 25,
                icon: Icon(Icons.delete),
              ),
              SizedBox(width: 11),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {},
                iconSize: 25,
                splashRadius: 20,
                icon: Icon(Icons.more_vert),
              ),
              SizedBox(width: 11),
            ],
          ),
        );
}
