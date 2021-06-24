// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStoreBase, Store {
  final _$foldedAtom = Atom(name: '_SearchStoreBase.folded');

  @override
  bool get folded {
    _$foldedAtom.reportRead();
    return super.folded;
  }

  @override
  set folded(bool value) {
    _$foldedAtom.reportWrite(value, super.folded, () {
      super.folded = value;
    });
  }

  final _$_SearchStoreBaseActionController =
      ActionController(name: '_SearchStoreBase');

  @override
  void setFolded() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.setFolded');
    try {
      return super.setFolded();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
folded: ${folded}
    ''';
  }
}
