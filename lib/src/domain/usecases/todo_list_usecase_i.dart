abstract class TodoListUsecaseI {
  Future<bool> create({required String name});
  Future<List<String>> read({required String key});
  Future<bool> delete({required int id});
  Future<bool> update({required int id, required String name});
}
