import 'package:mobx/mobx.dart';
import 'package:sevnotes2/theme/theme.dart';
import 'package:sevnotes2/theme/themes.dart';
part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  @observable
  int themeIndex = 0;

  @observable
  MyTheme theme = Themes.light;

  @action
  void setThemeIndex(int value) {
    themeIndex = value;
    switch (themeIndex) {
      case 0:
        {
          theme = Themes.light;
        }
        break;
      case 1:
        {
          theme = Themes.dark;
        }
        break;
      case 2:
        {
          theme = Themes.darkplus;
        }
        break;
      case 3:
        {
          theme = Themes.greenBlue;
        }
        break;
      case 4:
        {
          theme = Themes.grayYellow;
        }
        break;
      case 5:
        {
          theme = Themes.grayOrange;
        }
        break;
    }
  }
}
