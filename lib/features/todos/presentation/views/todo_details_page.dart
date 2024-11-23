import 'package:djamo_todo_tdd_test/features/todos/domain/entities/todo.dart';
import 'package:djamo_todo_tdd_test/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:djamo_todo_tdd_test/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoDetailsPage extends StatelessWidget {
  const TodoDetailsPage(
    this.todo, {
    super.key,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<TodoBloc>(),
      child: _TodoDetailsView(
        todo,
      ),
    );
  }
}

class _TodoDetailsView extends StatelessWidget {
  const _TodoDetailsView(this.todo);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          todo.title,
        ),
      ),
    );
  }
}
