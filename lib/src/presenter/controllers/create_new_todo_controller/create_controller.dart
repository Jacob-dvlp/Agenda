// ignore_for_file: use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/usecases/todo_list_usecase_i.dart';

part 'create_controller.g.dart';

class CreateNewTodoApp = CreareNewTodoController with _$CreateNewTodoApp;

abstract class CreareNewTodoController  with Store {
  @observable
  bool isLoading = false;
  final nameController = TextEditingController();

  final TodoListUsecaseI todoListUsecaseI;

  CreareNewTodoController({required this.todoListUsecaseI});

  @action
  Future create(context) async {
    loadingTocreateData(true);
    await todoListUsecaseI.create(name: nameController.text);
    loadingTocreateData(false);
  }

  @action
  Future update(
      {required int id, required String name, BuildContext? context}) async {
    loadingTocreateData(true);
    await todoListUsecaseI.update(id: id, name: nameController.text);
    loadingTocreateData(false);
  }

  @action
  loadingTocreateData(bool value) {
    isLoading = value;
  }
}
