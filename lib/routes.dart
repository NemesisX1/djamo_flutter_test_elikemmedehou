import 'package:djamo_todo_tdd_test/features/todos/presentation/views/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TodoPage();
      },
    ),
    GoRoute(
      path: '/details/:todoId',
      builder: (BuildContext context, GoRouterState state) {
        final todoId = state.pathParameters['todoId'];

        return const TodoPage();
      },
    ),
  ],
);
