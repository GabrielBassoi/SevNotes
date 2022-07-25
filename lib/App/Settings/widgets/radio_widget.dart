import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sevnotes2/data/theme_shared.dart';
import 'package:sevnotes2/stores/settings_store.dart';

class RadioWidget extends StatelessWidget {
  final int index;
  final LinearGradient gradient;
  final int duration;

  RadioWidget(this.index, this.gradient, this.duration,);

  final ThemeShared shared = ThemeShared();
  final SettingsStore setStore = GetIt.I<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setStore.setThemeIndex(index);
        shared.saveTheme(index);
      },
      child: AnimatedCard(
        direction: AnimatedCardDirection.top,
        duration: Duration(milliseconds: duration),
        child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              border: Border.all(
                  color: setStore.themeIndex == index
                      ? setStore.theme.primary
                      : setStore.theme.background,
                  width: 3.5),
              borderRadius: BorderRadius.circular(25),
              gradient: gradient,
            )),
      ),
    );
  }
}
