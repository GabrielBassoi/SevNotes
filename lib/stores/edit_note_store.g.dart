// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditNoteStore on _EditNoteStore, Store {
  late final _$idAtom = Atom(name: '_EditNoteStore.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$titleAtom = Atom(name: '_EditNoteStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$bodyAtom = Atom(name: '_EditNoteStore.body', context: context);

  @override
  String get body {
    _$bodyAtom.reportRead();
    return super.body;
  }

  @override
  set body(String value) {
    _$bodyAtom.reportWrite(value, super.body, () {
      super.body = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_EditNoteStore.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$editAtom = Atom(name: '_EditNoteStore.edit', context: context);

  @override
  bool get edit {
    _$editAtom.reportRead();
    return super.edit;
  }

  @override
  set edit(bool value) {
    _$editAtom.reportWrite(value, super.edit, () {
      super.edit = value;
    });
  }

  late final _$creationDateAtom =
      Atom(name: '_EditNoteStore.creationDate', context: context);

  @override
  String get creationDate {
    _$creationDateAtom.reportRead();
    return super.creationDate;
  }

  @override
  set creationDate(String value) {
    _$creationDateAtom.reportWrite(value, super.creationDate, () {
      super.creationDate = value;
    });
  }

  late final _$_EditNoteStoreActionController =
      ActionController(name: '_EditNoteStore', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_EditNoteStoreActionController.startAction(
        name: '_EditNoteStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_EditNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBody(String value) {
    final _$actionInfo = _$_EditNoteStoreActionController.startAction(
        name: '_EditNoteStore.setBody');
    try {
      return super.setBody(value);
    } finally {
      _$_EditNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFavorite() {
    final _$actionInfo = _$_EditNoteStoreActionController.startAction(
        name: '_EditNoteStore.setFavorite');
    try {
      return super.setFavorite();
    } finally {
      _$_EditNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setData(Note note, bool e) {
    final _$actionInfo = _$_EditNoteStoreActionController.startAction(
        name: '_EditNoteStore.setData');
    try {
      return super.setData(note, e);
    } finally {
      _$_EditNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addData() {
    final _$actionInfo = _$_EditNoteStoreActionController.startAction(
        name: '_EditNoteStore.addData');
    try {
      return super.addData();
    } finally {
      _$_EditNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveData() {
    final _$actionInfo = _$_EditNoteStoreActionController.startAction(
        name: '_EditNoteStore.saveData');
    try {
      return super.saveData();
    } finally {
      _$_EditNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteData() {
    final _$actionInfo = _$_EditNoteStoreActionController.startAction(
        name: '_EditNoteStore.deleteData');
    try {
      return super.deleteData();
    } finally {
      _$_EditNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int index() {
    final _$actionInfo = _$_EditNoteStoreActionController.startAction(
        name: '_EditNoteStore.index');
    try {
      return super.index();
    } finally {
      _$_EditNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
body: ${body},
isFavorite: ${isFavorite},
edit: ${edit},
creationDate: ${creationDate}
    ''';
  }
}
