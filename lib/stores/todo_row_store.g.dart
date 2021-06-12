// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_row_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoRowStore on _TodoRowStore, Store {
  final _$isCompletedAtom = Atom(name: '_TodoRowStore.isCompleted');

  @override
  bool get isCompleted {
    _$isCompletedAtom.reportRead();
    return super.isCompleted;
  }

  @override
  set isCompleted(bool value) {
    _$isCompletedAtom.reportWrite(value, super.isCompleted, () {
      super.isCompleted = value;
    });
  }

  final _$textAtom = Atom(name: '_TodoRowStore.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$_TodoRowStoreActionController =
      ActionController(name: '_TodoRowStore');

  @override
  void setData(Todo todo) {
    final _$actionInfo = _$_TodoRowStoreActionController.startAction(
        name: '_TodoRowStore.setData');
    try {
      return super.setData(todo);
    } finally {
      _$_TodoRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setText(String value) {
    final _$actionInfo = _$_TodoRowStoreActionController.startAction(
        name: '_TodoRowStore.setText');
    try {
      return super.setText(value);
    } finally {
      _$_TodoRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompleted(bool value) {
    final _$actionInfo = _$_TodoRowStoreActionController.startAction(
        name: '_TodoRowStore.setCompleted');
    try {
      return super.setCompleted(value);
    } finally {
      _$_TodoRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCompleted: ${isCompleted},
text: ${text}
    ''';
  }
}
