import 'package:djamo_todo_tdd_test/features/todos/domain/entities/todo.dart';
import 'package:djamo_todo_tdd_test/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:djamo_todo_tdd_test/features/todos/presentation/widgets/add_todo_bottom_sheet_widget.dart';
import 'package:djamo_todo_tdd_test/features/todos/presentation/widgets/loader_widget.dart';
import 'package:djamo_todo_tdd_test/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<TodoBloc>(),
      child: const TodoView(),
    );
  }
}

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TodoBloc>().add(TodoEventFetchTodos());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bienvenue dans TodoApp',
        ),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoIsLoading) return const LoaderWidget();

          if (state is TodoHasError) {
            return const Center(
              child: Text('Une erreur est survenue !'),
            );
          }

          if (state is TodoFetched) {
            if (state.todos.isEmpty) {
              return Center(
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add,
                  ),
                  label: const Text(
                    'Ajoutez une première tâche',
                  ),
                  onPressed: () {
                    _showAddTodoModal(context);
                  },
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [],
              ),
            );
          }

          return const SizedBox();
        },
      ),
      floatingActionButton: context.watch<TodoBloc>().todos.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                _showAddTodoModal(context);
              },
              child: const Icon(
                CupertinoIcons.add,
              ),
            )
          : const SizedBox(),
    );
  }

  void _showAddTodoModal(BuildContext context) {
    showModalBottomSheet<Todo?>(
      context: context,
      builder: (_) => AddTodoBottomSheet(),
    ).then(
      (value) {
        if (value != null && context.mounted) {
          context.read<TodoBloc>().add(
                TodoEventAddTodo(value),
              );
        }
      },
    );
  }
}
