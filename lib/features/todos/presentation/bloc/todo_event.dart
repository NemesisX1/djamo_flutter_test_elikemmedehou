part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoEventFetchTodos extends TodoEvent {}

class TodoEventAddTodo extends TodoEvent {
  TodoEventAddTodo(this.todo);
  final Todo todo;
}

class TodoEventToogleDeletion extends TodoEvent {
  TodoEventToogleDeletion(this.todoId);
  final int todoId;
}

class TodoEventUpdateTodo extends TodoEvent {
  TodoEventUpdateTodo(this.todo);
  final Todo todo;
}

class TodoEventDeleteTodos extends TodoEvent {
  TodoEventDeleteTodos(this.todoIds);
  final List<int> todoIds;
}
