import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/models/note.dart';
import 'package:sevnotes2/stores/edit_note_store.dart';

class EditNote extends StatelessWidget {

  final Note note;
  EditNote(this.note);

  final EditNoteStore store = EditNoteStore();

  @override
  Widget build(BuildContext context) {

    store.setData(note);
    
    return Container(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          elevation: 15,
          shadowColor: Color.fromRGBO(100, 100, 100, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))
          ),
          title: Text("${note.creationDate}", style: GoogleFonts.roboto(fontSize: 15, color: Color.fromRGBO(93, 93, 93, 100))),
          leading: IconButton (
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: Navigator.of(context).pop,
            splashRadius: 20,
            iconSize: 25,
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          actions: [
            Observer(
              builder: (_) {
                return IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  splashRadius: 20,
                  onPressed: store.setFavorite,
                  iconSize: 25,
                  icon: store.isFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
                );
              }
            ),
            SizedBox(width: 11,),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              splashRadius: 20,
              onPressed: (){},
              iconSize: 25,
              icon: Icon(Icons.delete),
            ),
            SizedBox(width: 11,),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: (){},
              iconSize: 25,
              splashRadius: 20,
              icon: Icon(Icons.more_vert),
            ),
            SizedBox(width: 11,),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15,top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3, 3),
                      blurRadius: 10,
                      color: Color.fromRGBO(100, 100, 100, 50),
                    )
                  ],
                ),
                child: TextFormField(
                  onChanged: store.setTitle,
                  initialValue: note.title,
                  maxLength: 50,
                  maxLines: 1,
                  style: GoogleFonts.roboto(),
                  decoration: InputDecoration(
                      border: InputBorder.none, counterText: "",
                    hintText: "Title",
                    hintStyle: GoogleFonts.roboto(color: Colors.black.withAlpha(860))
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15,top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 10,
                        color: Color.fromRGBO(100, 100, 100, 50),
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: TextFormField(
                      onChanged: store.setBody,
                      initialValue: note.body,
                      maxLines: null,
                      style: GoogleFonts.roboto(),  
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        hintText: "Text",
                        hintStyle: GoogleFonts.roboto(color: Colors.black.withAlpha(860)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
