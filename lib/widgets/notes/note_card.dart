import 'package:flutter/material.dart';
import 'package:sevnotes2/models/note.dart';
import 'package:sevnotes2/screens/edit_note.dart';

class NoteCard extends StatelessWidget {

  final Note note;
  NoteCard(this.note);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditNote(note)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 10,
              color: Color.fromRGBO(100, 100, 100, 50)
            )
          ]
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(note.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, fontFamily: "Roboto",),
                      )
                  ),
                  Icon(Icons.ac_unit, size: 20,),
                ],
              ),
              SizedBox(height: 12,),
              Text(note.body, style: TextStyle(fontSize: 10, fontFamily: "Roboto"), maxLines: 6,),
              Expanded(
                  child: Align(alignment: Alignment.bottomLeft,
                      child: Text("${note.creationDate}", style: TextStyle(fontSize: 9, color: Colors.black45, fontFamily: "Roboto"),)
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
