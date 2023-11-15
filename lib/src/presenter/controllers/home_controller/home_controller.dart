import 'package:mobx/mobx.dart';

import '../../../domain/usecases/todo_list_usecase_i.dart';
part 'home_controller.g.dart';

class HomeControllerApp = HomeController with _$HomeControllerApp;

abstract class HomeController with Store {
  @observable
  bool isLoadingReadData = false;

  @observable
  List<String>? entitieUserModel = [];
  late final TodoListUsecaseI todoListUsecaseI;
  HomeController({required this.todoListUsecaseI});

  @action
  Future read() async {
    loadingreadData(true);
    entitieUserModel = await todoListUsecaseI.read(key: "todolist");
    loadingreadData(false);
  }

  @action
  Future delete(int id) async {
    await todoListUsecaseI.delete(id: id);
  }

  @action
  loadingreadData(bool value) {
    isLoadingReadData = value;
  }
}
