import 'package:djamo_todo_tdd_test/features/todos/data/datasources/todo_data_source.dart';
import 'package:djamo_todo_tdd_test/features/todos/data/datasources/todo_local_data_source.dart';
import 'package:djamo_todo_tdd_test/features/todos/data/repositories/todo_repository_impl.dart';
import 'package:djamo_todo_tdd_test/features/todos/domain/repositories/todo_repository.dart';
import 'package:djamo_todo_tdd_test/features/todos/domain/usecases/add_todo_usecase.dart';
import 'package:djamo_todo_tdd_test/features/todos/domain/usecases/delete_todos_usecase.dart';
import 'package:djamo_todo_tdd_test/features/todos/domain/usecases/get_todos_usecase.dart';
import 'package:djamo_todo_tdd_test/features/todos/domain/usecases/update_todo_usecase.dart';
import 'package:djamo_todo_tdd_test/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator

    /// register Bloc
    ..registerFactory(
      TodoBloc.new,
    )

    /// register usecases
    ..registerLazySingleton(
      () => GetTodosUseCases(locator()),
    )
    ..registerLazySingleton(
      () => UpdateTodoUseCase(locator()),
    )
    ..registerLazySingleton(
      () => AddTodoUseCase(locator()),
    )
    ..registerLazySingleton(
      () => DeleteTodosUseCase(locator()),
    )

    /// register repository
    ..registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(
        locator(),
      ),
    )

    /// register data source
    ..registerLazySingleton<TodoDataSource>(
      TodoLocalDataSourceImpl.new,
    );
}
