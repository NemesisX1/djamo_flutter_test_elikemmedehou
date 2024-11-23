import 'package:djamo_todo_tdd_test/bootstrap.dart';
import 'package:djamo_todo_tdd_test/features/todos/data/datasources/todo_data_source.dart';
import 'package:djamo_todo_tdd_test/features/todos/data/models/todo_model.dart';
import 'package:isar/isar.dart';

class TodoLocalDataSourceImpl implements TodoDataSource {
  @override
  Future<List<TodoModel>> getTodosFromDataSource() async {
    late List<TodoModel> todos;

    await isar.txn(() async {
      todos = await isar.todoModels.where().findAll();
    });
    return todos;
  }

  @override
  Future<TodoModel> saveTodoOnDataSource({
    required String body,
    required String title,
  }) async {
    final todo = TodoModel()
      ..body = body
      ..title = title
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    await isar.txn(() async {
      await isar.todoModels.put(
        todo,
      );
    });

    return todo;
  }

  @override
  Future<TodoModel> updateTodoOnDataSource(
    Id id, {
    required String body,
    required String title,
  }) async {
    final todo = TodoModel()
      ..id = id
      ..body = body
      ..title = title
      ..updatedAt = DateTime.now();

    await isar.txn(() async {
      await isar.todoModels.put(
        todo,
      );
    });

    return todo;
  }

  @override
  Future<bool> deleteTodoFromDataSource(Id id) async {
    var isDeleted = false;

    await isar.txn(() async {
      isDeleted = await isar.todoModels.delete(
        id,
      );
    });

    return isDeleted;
  }
}
