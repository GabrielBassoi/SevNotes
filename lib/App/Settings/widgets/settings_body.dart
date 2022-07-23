import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/stores/settings_store.dart';

import 'radio_widget.dart';

class SettingsBody extends StatelessWidget {
  SettingsBody();

  final SettingsStore setStore = GetIt.I<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedCard(
            direction: AnimatedCardDirection.left,
            child: Padding(
              padding: const EdgeInsets.only(left: 22, bottom: 3),
              child: Text(
                "Theme's",
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: setStore.theme.text),
              ),
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.left,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 55,
              width: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: setStore.theme.layout,
              ),
              child: Observer(
                builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RadioWidget(
                        0,
                        const LinearGradient(
                          stops: [0.3, 1.0],
                          colors: [
                            Color(0xFFA6A6A6),
                            Colors.white,
                          ],
                        ),
                        800,
                      ),
                      RadioWidget(
                        1,
                        const LinearGradient(
                          colors: [
                            Color(0xFF2E2E2E),
                            Colors.white,
                          ],
                        ),
                        850,
                      ),
                      RadioWidget(
                        2,
                        const LinearGradient(
                          stops: [0.2, 1.0],
                          colors: [
                            Color(0xFF1D1D1D),
                            Colors.white,
                          ],
                        ),
                        900,
                      ),
                      RadioWidget(
                        3,
                        const LinearGradient(
                          stops: [0.2, 1.0],
                          colors: [
                            Color(0xFF2B3138),
                            Color(0xFF03FF1C),
                          ],
                        ),
                        950,
                      ),
                      RadioWidget(
                        4,
                        const LinearGradient(
                          stops: [0.2, 1.0],
                          colors: [
                            Color(0xFF2E2E2E),
                            Color(0xFFFFD60A),
                          ],
                        ),
                        1000,
                      ),
                      RadioWidget(
                        5,
                        const LinearGradient(
                          stops: [0.2, 1.0],
                          colors: [
                            Color(0xFF2E2E2E),
                            Color(0xFFFF7A00),
                          ],
                        ),
                        1050,
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
