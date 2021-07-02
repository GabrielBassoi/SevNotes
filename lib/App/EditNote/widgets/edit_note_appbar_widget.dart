import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/App/EditNote/widgets/aler_dialog_widget.dart';
import 'package:sevnotes2/data/data.dart';
import 'package:sevnotes2/stores/edit_note_store.dart';
import 'package:sevnotes2/stores/home_store.dart';

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
                if (store.edit == false) {
                  store.addData();
                } else {
                  store.saveData();
                }
                HomeStore homeStore = GetIt.I<HomeStore>();
                Data().saveData(homeStore.primaryList.toList());
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
                onPressed: store.edit
                    ? () {
                        showDialogWidget(context, store);
                      }
                    : null,
                iconSize: 25,
                icon: Icon(Icons.delete),
              ),
              SizedBox(width: 11),
            ],
          ),
        );
}
