import 'package:app_processo_seletivo_target/src/domain/datasource/local/todo_list_datasource_local_i.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListDatasourceImp extends TodoListDatasourceLocalI {
  @override
  Future<List<String>> read({required String key}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final list = sharedPreferences.getStringList(key) ?? [];
    return list;
  }

  @override
  Future<bool> create({required String name}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final list = await read(key: "todolist");
    list.add(name);
    final value = await sharedPreferences.setStringList("todolist", list);
    return value;
  }

  @override
  Future<bool> delete({required int id}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final list = await read(key: "todolist");
    list.removeAt(id);
    read(key: "todolist");
    return await sharedPreferences.setStringList("todolist", list);
  }

  @override
  Future<bool> update({required int id, required String name}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final list = await read(key: "todolist");
    list.removeAt(id);
    list.insert(id, name);
    return await sharedPreferences.setStringList("todolist", list);
  }
}
