import 'package:shared_preferences/shared_preferences.dart';

class ThemeShared {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveTheme(int value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("index", value);
  }

  Future<int?> loadTheme() async {
    try {
      final SharedPreferences prefs = await _prefs;
      return prefs.getInt("index");
    } catch (e) {
      return 0;
    }
  }
}
