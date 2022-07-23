import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/stores/settings_store.dart';

class EmptyList extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icons;

  EmptyList({
    required this.title,
    required this.subTitle,
    required this.icons,
  });

  final SettingsStore setStore = GetIt.I<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons,
            size: 100,
            color: setStore.theme.primary,
          ),
          Wrap(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: setStore.theme.text,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            children: [
              Text(
                subTitle,
                style: GoogleFonts.roboto(color: setStore.theme.clockDate),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
