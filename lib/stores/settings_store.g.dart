// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStoreBase, Store {
  late final _$themeIndexAtom =
      Atom(name: '_SettingsStoreBase.themeIndex', context: context);

  @override
  int get themeIndex {
    _$themeIndexAtom.reportRead();
    return super.themeIndex;
  }

  @override
  set themeIndex(int value) {
    _$themeIndexAtom.reportWrite(value, super.themeIndex, () {
      super.themeIndex = value;
    });
  }

  late final _$themeAtom =
      Atom(name: '_SettingsStoreBase.theme', context: context);

  @override
  MyTheme get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(MyTheme value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$_SettingsStoreBaseActionController =
      ActionController(name: '_SettingsStoreBase', context: context);

  @override
  void setThemeIndex(int value) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.setThemeIndex');
    try {
      return super.setThemeIndex(value);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeIndex: ${themeIndex},
theme: ${theme}
    ''';
  }
}
