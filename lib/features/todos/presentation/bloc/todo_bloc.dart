import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:djamo_todo_tdd_test/features/todos/domain/entities/todo.dart';
import 'package:djamo_todo_tdd_test/features/todos/domain/repositories/todo_repository.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(TodoInitial()) {
    on<TodoEventFetchTodos>((event, emit) async {
      emit(TodoIsLoading());

      try {
        todos = await _todoRepository.getTodos();

        emit(TodoFetched(todos));
      } catch (e) {
        emit(TodoHasError(e));
      }
    });

    on<TodoEventAddTodo>((event, emit) async {
      emit(TodoIsLoading());

      try {
        await _todoRepository.saveTodo(
          event.todo,
        );

        todos = await _todoRepository.getTodos();

        emit(TodoFetched(todos));
      } catch (e) {
        emit(TodoHasError(e));
      }
    });

    on<TodoEventUpdateTodo>((event, emit) async {
      emit(TodoIsLoading());

      try {
        await _todoRepository.updateTodo(
          event.todo,
        );

        todos = await _todoRepository.getTodos();

        emit(TodoFetched(todos));
      } catch (e) {
        emit(TodoHasError(e));
      }
    });

    on<TodoEventToogleDeletion>((event, emit) async {
      emit(TodoIsLoading());

      if (todoIdsToDelete.contains(event.todoId)) {
        todoIdsToDelete.remove(event.todoId);
      } else {
        todoIdsToDelete.add(event.todoId);
      }

      emit(TodoFetched(todos));
    });

    on<TodoEventDeleteTodos>((event, emit) async {
      emit(TodoIsLoading());

      try {
        await _todoRepository.deleteTodos(
          event.todoIds,
        );

        todoIdsToDelete.clear();

        todos = await _todoRepository.getTodos();

        emit(TodoFetched(todos));
      } catch (e) {
        emit(TodoHasError(e));
      }
    });
  }

  final TodoRepository _todoRepository;
  List<Todo> todos = [];
  List<int> todoIdsToDelete = [];
}
