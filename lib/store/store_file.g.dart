// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_file.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreFileA on StoreFileBase, Store {
  final _$imagesAtom = Atom(name: 'StoreFileBase.images');

  @override
  ObservableList<Image> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<Image> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$StoreFileBaseActionController =
      ActionController(name: 'StoreFileBase');

  @override
  void addItem(Image data) {
    final _$actionInfo = _$StoreFileBaseActionController.startAction(
        name: 'StoreFileBase.addItem');
    try {
      return super.addItem(data);
    } finally {
      _$StoreFileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
images: ${images}
    ''';
  }
}
