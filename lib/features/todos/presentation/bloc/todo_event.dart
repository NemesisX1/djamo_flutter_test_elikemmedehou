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

class TodoEventDeleteTodo extends TodoEvent {
  TodoEventDeleteTodo(this.todo);
  final Todo todo;
}

class TodoEventUpdateTodo extends TodoEvent {
  TodoEventUpdateTodo(this.todo);
  final Todo todo;
}
