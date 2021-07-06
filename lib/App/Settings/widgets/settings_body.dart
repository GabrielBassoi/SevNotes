import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevnotes2/data/theme_shared.dart';
import 'package:sevnotes2/stores/settings_store.dart';

import 'radio_widget.dart';

class SettingsBody extends StatelessWidget {
  SettingsBody({Key key}) : super(key: key);

  final SettingsStore setStore = GetIt.I<SettingsStore>();
  final ThemeShared shared = ThemeShared();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, bottom: 3),
            child: Text(
              "Theme's",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: setStore.theme.text),
            ),
          ),
          Container(
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
                      setStore.themeIndex == 0
                          ? setStore.theme.primary
                          : setStore.theme.background,
                      () {
                        setStore.setThemeIndex(0);
                        shared.saveTheme(0);
                      },
                      LinearGradient(
                        stops: [0.3, 1.0],
                        colors: [
                          Color(0xFFA6A6A6),
                          Colors.white,
                        ],
                      ),
                    ),
                    RadioWidget(
                      setStore.themeIndex == 1
                          ? setStore.theme.primary
                          : setStore.theme.background,
                      () {
                        setStore.setThemeIndex(1);
                        shared.saveTheme(1);
                      },
                      LinearGradient(
                        colors: [
                          Color(0xFF2E2E2E),
                          Colors.white,
                        ],
                      ),
                    ),
                    RadioWidget(
                      setStore.themeIndex == 2
                          ? setStore.theme.primary
                          : setStore.theme.background,
                      () {
                        setStore.setThemeIndex(2);
                        shared.saveTheme(2);
                      },
                      LinearGradient(
                        stops: [0.2, 1.0],
                        colors: [
                          Color(0xFF1D1D1D),
                          Colors.white,
                        ],
                      ),
                    ),
                    RadioWidget(
                      setStore.themeIndex == 3
                          ? setStore.theme.primary
                          : setStore.theme.background,
                      () {
                        setStore.setThemeIndex(3);
                        shared.saveTheme(3);
                      },
                      LinearGradient(
                        stops: [0.2, 1.0],
                        colors: [
                          Color(0xFF2B3138),
                          Color(0xFF03FF1C),
                        ],
                      ),
                    ),
                    RadioWidget(
                      setStore.themeIndex == 4
                          ? setStore.theme.primary
                          : setStore.theme.background,
                      () {
                        setStore.setThemeIndex(4);
                        shared.saveTheme(4);
                      },
                      LinearGradient(
                        stops: [0.2, 1.0],
                        colors: [
                          Color(0xFF2E2E2E),
                          Color(0xFFFFD60A),
                        ],
                      ),
                    ),
                    RadioWidget(
                      setStore.themeIndex == 5
                          ? setStore.theme.primary
                          : setStore.theme.background,
                      () {
                        setStore.setThemeIndex(5);
                        shared.saveTheme(5);
                      },
                      LinearGradient(
                        stops: [0.2, 1.0],
                        colors: [
                          Color(0xFF2E2E2E),
                          Color(0xFFFF7A00),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
