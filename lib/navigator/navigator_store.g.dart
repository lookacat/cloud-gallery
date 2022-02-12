// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigatorStoreA on NavigatorStoreBase, Store {
  final _$routeAtom = Atom(name: 'NavigatorStoreBase.route');

  @override
  String get route {
    _$routeAtom.reportRead();
    return super.route;
  }

  @override
  set route(String value) {
    _$routeAtom.reportWrite(value, super.route, () {
      super.route = value;
    });
  }

  final _$routeParametersAtom =
      Atom(name: 'NavigatorStoreBase.routeParameters');

  @override
  Map<String, dynamic>? get routeParameters {
    _$routeParametersAtom.reportRead();
    return super.routeParameters;
  }

  @override
  set routeParameters(Map<String, dynamic>? value) {
    _$routeParametersAtom.reportWrite(value, super.routeParameters, () {
      super.routeParameters = value;
    });
  }

  final _$NavigatorStoreBaseActionController =
      ActionController(name: 'NavigatorStoreBase');

  @override
  void changeRoute(String value, {Map<String, dynamic>? parameters}) {
    final _$actionInfo = _$NavigatorStoreBaseActionController.startAction(
        name: 'NavigatorStoreBase.changeRoute');
    try {
      return super.changeRoute(value, parameters: parameters);
    } finally {
      _$NavigatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic goBack() {
    final _$actionInfo = _$NavigatorStoreBaseActionController.startAction(
        name: 'NavigatorStoreBase.goBack');
    try {
      return super.goBack();
    } finally {
      _$NavigatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
route: ${route},
routeParameters: ${routeParameters}
    ''';
  }
}
