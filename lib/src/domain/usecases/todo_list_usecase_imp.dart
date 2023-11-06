import 'package:app_processo_seletivo_target/src/domain/respository/todo_list_repository_i.dart';
import 'package:app_processo_seletivo_target/src/domain/usecases/todo_list_usecase_i.dart';

class TodoListUsecaseImp extends TodoListUsecaseI {
  final TodoListRepositoryI todoListRepositoryI;

  TodoListUsecaseImp({required this.todoListRepositoryI});

  @override
  Future<bool> create({required String name}) async {
    return await todoListRepositoryI.create(name: name);
  }

  @override
  Future<List<String>> read({required String key}) async {
    return await todoListRepositoryI.read(key: key);
  }

  @override
  Future<bool> delete({required int id}) async {
    return await todoListRepositoryI.delete(id: id);
  }

  @override
  Future<bool> update({required int id, required String name}) async {
    return await todoListRepositoryI.update(id: id, name: name);
  }
}
