import 'dart:async';

import 'package:fl_mvvm/fl_mvvm.dart';
import 'package:todo_app/app/dependencies/app_dependencies.dart';
import 'package:todo_app/domain/entities/todo.dart';
import 'package:todo_app/domain/values/todo_progress.dart';
import 'package:todo_app/presentation/views/todo/todos_view_model.dart';

class TodoProgressViewModel extends FlViewModel<TodoProgress> {
  @override
  FutureOr<TodoProgress?> build() {
    var state = ref.watch(serviceLocator.get<TodosViewModel>().provider);

    if (state.hasValue) {
      var todos = (state.value as List<Todo>);
      int completeCount =
          todos.where((element) => element.isComplete).length ?? 0;
      int inCompleteCount = (todos.length) - completeCount;
      return TodoProgress(
          completed: completeCount, inCompleted: inCompleteCount);
    }

    return null;
  }
}
