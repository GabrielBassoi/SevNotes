// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$tabIndexAtom =
      Atom(name: '_HomeStore.tabIndex', context: context);

  @override
  int? get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int? value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  late final _$foldedAtom = Atom(name: '_HomeStore.folded', context: context);

  @override
  bool? get folded {
    _$foldedAtom.reportRead();
    return super.folded;
  }

  @override
  set folded(bool? value) {
    _$foldedAtom.reportWrite(value, super.folded, () {
      super.folded = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_HomeStore.searchText', context: context);

  @override
  String? get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String? value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$primaryListAtom =
      Atom(name: '_HomeStore.primaryList', context: context);

  @override
  ObservableList<Note> get primaryList {
    _$primaryListAtom.reportRead();
    return super.primaryList;
  }

  @override
  set primaryList(ObservableList<Note> value) {
    _$primaryListAtom.reportWrite(value, super.primaryList, () {
      super.primaryList = value;
    });
  }

  late final _$notesListAtom =
      Atom(name: '_HomeStore.notesList', context: context);

  @override
  ObservableList<Note> get notesList {
    _$notesListAtom.reportRead();
    return super.notesList;
  }

  @override
  set notesList(ObservableList<Note> value) {
    _$notesListAtom.reportWrite(value, super.notesList, () {
      super.notesList = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setTabIndex(int value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setTabIndex');
    try {
      return super.setTabIndex(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFolded() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setFolded');
    try {
      return super.setFolded();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPrimaryObject(Note note, int index) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setPrimaryObject');
    try {
      return super.setPrimaryObject(note, index);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPrimaryList(List<Note> list) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setPrimaryList');
    try {
      return super.setPrimaryList(list);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void rm(int i) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.rm');
    try {
      return super.rm(i);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNotesObject(Note note, int index) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setNotesObject');
    try {
      return super.setNotesObject(note, index);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNotesList(List<Note> list) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setNotesList');
    try {
      return super.setNotesList(list);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void search() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.search');
    try {
      return super.search();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveData() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.saveData');
    try {
      return super.saveData();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabIndex: ${tabIndex},
folded: ${folded},
searchText: ${searchText},
primaryList: ${primaryList},
notesList: ${notesList}
    ''';
  }
}
