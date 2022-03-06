// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_file.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreFileA on StoreFileBase, Store {
  final _$filesAtom = Atom(name: 'StoreFileBase.files');

  @override
  ObservableMap<String, dynamic> get files {
    _$filesAtom.reportRead();
    return super.files;
  }

  @override
  set files(ObservableMap<String, dynamic> value) {
    _$filesAtom.reportWrite(value, super.files, () {
      super.files = value;
    });
  }

  final _$StoreFileBaseActionController =
      ActionController(name: 'StoreFileBase');

  @override
  void setFiles(ObservableMap<String, dynamic> data) {
    final _$actionInfo = _$StoreFileBaseActionController.startAction(
        name: 'StoreFileBase.setFiles');
    try {
      return super.setFiles(data);
    } finally {
      _$StoreFileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
files: ${files}
    ''';
  }
}
