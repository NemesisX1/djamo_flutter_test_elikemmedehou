import 'package:djamo_todo_tdd_test/features/todos/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<Todo> saveTodo(Todo todo);
  Future<bool> deleteTodo(Todo todo);
  Future<Todo> updateTodo(Todo todo);
}