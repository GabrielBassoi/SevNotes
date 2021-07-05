import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sevnotes2/stores/settings_store.dart';

import 'radio_widget.dart';

class SettingsBody extends StatelessWidget {
  SettingsBody({Key key}) : super(key: key);

  final SettingsStore store = GetIt.I<SettingsStore>();

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
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 55,
            width: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: Observer(
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RadioWidget(
                      store.themeIndex == 0 ? Colors.blue : Colors.grey[600],
                      () {
                        store.setThemeIndex(0);
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
                      store.themeIndex == 1 ? Colors.blue : Colors.grey[600],
                      () {
                        store.setThemeIndex(1);
                      },
                      LinearGradient(
                        colors: [
                          Color(0xFF2E2E2E),
                          Colors.white,
                        ],
                      ),
                    ),
                    RadioWidget(
                      store.themeIndex == 2 ? Colors.blue : Colors.grey[600],
                      () {
                        store.setThemeIndex(2);
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
                      store.themeIndex == 3 ? Colors.blue : Colors.grey[600],
                      () {
                        store.setThemeIndex(3);
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
                      store.themeIndex == 4 ? Colors.blue : Colors.grey[600],
                      () {
                        store.setThemeIndex(4);
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
                      store.themeIndex == 5 ? Colors.blue : Colors.grey[600],
                      () {
                        store.setThemeIndex(5);
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
