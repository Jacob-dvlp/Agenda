// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateNewTodoApp on CreareNewTodoController, Store {
  late final _$isLoadingAtom =
      Atom(name: 'CreareNewTodoController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$createAsyncAction =
      AsyncAction('CreareNewTodoController.create', context: context);

  @override
  Future<dynamic> create(dynamic context) {
    return _$createAsyncAction.run(() => super.create(context));
  }

  late final _$updateAsyncAction =
      AsyncAction('CreareNewTodoController.update', context: context);

  @override
  Future<dynamic> update(
      {required int id, required String name, BuildContext? context}) {
    return _$updateAsyncAction
        .run(() => super.update(id: id, name: name, context: context));
  }

  late final _$CreareNewTodoControllerActionController =
      ActionController(name: 'CreareNewTodoController', context: context);

  @override
  dynamic loadingTocreateData(bool value) {
    final _$actionInfo = _$CreareNewTodoControllerActionController.startAction(
        name: 'CreareNewTodoController.loadingTocreateData');
    try {
      return super.loadingTocreateData(value);
    } finally {
      _$CreareNewTodoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
