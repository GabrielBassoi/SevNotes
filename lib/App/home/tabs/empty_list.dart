
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyList extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icons;

  EmptyList({
    @required this.title,
    @required this.subTitle,
    @required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons, size: 100),
          Wrap(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.w800),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              Text(
                subTitle,
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
