import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/App/EditNote/widgets/aler_dialog_widget.dart';
import 'package:sevnotes2/data/data.dart';
import 'package:sevnotes2/stores/edit_note_store.dart';
import 'package:sevnotes2/stores/home_store.dart';
import 'package:sevnotes2/stores/settings_store.dart';

class EditNoteAppBarWidget extends PreferredSize {
  final EditNoteStore store;
  final BuildContext context;
  final SettingsStore setStore;
  EditNoteAppBarWidget(this.store, this.context, this.setStore)
      : super(
          preferredSize: const Size.fromHeight(60),
          child: AnimatedCard(
            direction: AnimatedCardDirection.top,
            child: AppBar(
              backgroundColor: setStore.theme.layout,
              toolbarHeight: 65,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              title: AnimatedCard(
                direction: AnimatedCardDirection.top,
                initDelay: const Duration(milliseconds: 800),
                child: Observer(
                  builder: (_) {
                    return Text(
                      store.creationDate,
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        color: setStore.theme.clockDate,
                      ),
                    );
                  },
                ),
              ),
              leading: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  if (store.edit == false) {
                    store.addData();
                  } else {
                    store.saveData();
                  }
                  HomeStore homeStore = GetIt.I<HomeStore>();
                  homeStore.saveData();
                  Navigator.of(context).pop();
                },
                splashRadius: 20,
                iconSize: 25,
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: setStore.theme.primary,
                ),
              ),
              actions: [
                AnimatedCard(
                  direction: AnimatedCardDirection.right,
                  initDelay: Duration(milliseconds: 800),
                  child: Observer(builder: (_) {
                    return IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      splashRadius: 20,
                      onPressed: store.setFavorite,
                      iconSize: 25,
                      icon: store.isFavorite
                          ? Icon(
                              Icons.star,
                              color: setStore.theme.primary,
                            )
                          : Icon(
                              Icons.star_border,
                              color: setStore.theme.primary,
                            ),
                    );
                  }),
                ),
                const SizedBox(width: 11),
                AnimatedCard(
                  direction: AnimatedCardDirection.right,
                  initDelay: const Duration(milliseconds: 900),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashRadius: 20,
                    onPressed: store.edit
                        ? (){showDialogWidget(context, store);}
                        : (){Navigator.of(context).pop();},
                    iconSize: 25,
                    icon: Icon(
                      Icons.delete,
                      color: setStore.theme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 11),
              ],
            ),
          ),
        );
}
