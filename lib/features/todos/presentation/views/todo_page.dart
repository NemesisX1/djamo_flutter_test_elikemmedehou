import 'package:djamo_todo_tdd_test/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:djamo_todo_tdd_test/features/todos/presentation/widgets/loader_widget.dart';
import 'package:djamo_todo_tdd_test/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<TodoBloc>(),
      child: const _TodoView(),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView();

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
                  onPressed: () {},
                ),
              );
            }
            return const SingleChildScrollView(
              child: Column(
                children: [],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
