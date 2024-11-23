part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoIsLoading extends TodoState {}

class TodoFetched extends TodoState {
  TodoFetched(this.todos);

  final List<Todo> todos;
}

class TodoHasError extends TodoState {
  TodoHasError(this.error);

  final Object error;
}
