import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:djamo_todo_tdd_test/features/todos/data/models/todo_model.dart';
import 'package:djamo_todo_tdd_test/locator.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [TodoModelSchema],
    directory: dir.path,
  );

  runApp(await builder());
}
