import '../../../domain/datasource/local/todo_list_datasource_local_i.dart';
import '../../../domain/respository/todo_list_repository_i.dart';

class TodoListRepositoryImp extends TodoListRepositoryI {
  final TodoListDatasourceLocalI todoListDatasourceImp;

  TodoListRepositoryImp({required this.todoListDatasourceImp});
  @override
  Future<List<String>> read({required String key}) async {
    return await todoListDatasourceImp.read(key: key);
  }

  @override
  Future<bool> create({
    required String name,
  }) {
    return todoListDatasourceImp.create(name: name);
  }

  @override
  Future<bool> delete({required int id}) async {
    return await todoListDatasourceImp.delete(id: id);
  }

  @override
  Future<bool> update({required int id, required String name}) async {
    return await todoListDatasourceImp.update(id: id, name: name);
  }
}
