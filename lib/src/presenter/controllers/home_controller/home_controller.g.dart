// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeControllerApp on HomeController, Store {
  late final _$isLoadingReadDataAtom =
      Atom(name: 'HomeController.isLoadingReadData', context: context);

  @override
  bool get isLoadingReadData {
    _$isLoadingReadDataAtom.reportRead();
    return super.isLoadingReadData;
  }

  @override
  set isLoadingReadData(bool value) {
    _$isLoadingReadDataAtom.reportWrite(value, super.isLoadingReadData, () {
      super.isLoadingReadData = value;
    });
  }

  late final _$entitieUserModelAtom =
      Atom(name: 'HomeController.entitieUserModel', context: context);

  @override
  List<String>? get entitieUserModel {
    _$entitieUserModelAtom.reportRead();
    return super.entitieUserModel;
  }

  @override
  set entitieUserModel(List<String>? value) {
    _$entitieUserModelAtom.reportWrite(value, super.entitieUserModel, () {
      super.entitieUserModel = value;
    });
  }

  late final _$readAsyncAction =
      AsyncAction('HomeController.read', context: context);

  @override
  Future<dynamic> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  late final _$deleteAsyncAction =
      AsyncAction('HomeController.delete', context: context);

  @override
  Future<dynamic> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$HomeControllerActionController =
      ActionController(name: 'HomeController', context: context);

  @override
  dynamic loadingreadData(bool value) {
    final _$actionInfo = _$HomeControllerActionController.startAction(
        name: 'HomeController.loadingreadData');
    try {
      return super.loadingreadData(value);
    } finally {
      _$HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingReadData: ${isLoadingReadData},
entitieUserModel: ${entitieUserModel}
    ''';
  }
}
