import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/App/EditNote/edit_note.dart';
import 'package:sevnotes2/models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final int index;
  NoteCard(this.note, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => EditNote(note: note, index: index)));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              maxLines: 1,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Expanded(
                child: Text(
              note.body,
              maxLines: 6,
              style: GoogleFonts.roboto(fontSize: 12),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  note.creationDate,
                  style: GoogleFonts.roboto(fontSize: 11),
                ),
                note.isFavorite == true ? Icon(Icons.star, color: Color.fromARGB(255, 218, 165, 32),) : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
