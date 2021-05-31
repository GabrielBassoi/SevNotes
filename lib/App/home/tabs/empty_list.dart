import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.help_outline, size: 100),
          Wrap(
            children: [
              Text(
                "Where is my notes???",
                style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              Text(
                "Click on the add button to add your first note!",
                style: GoogleFonts.roboto(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
