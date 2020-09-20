import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertaskmanager/models/task.dart';

abstract class TasksEvent {}

class TaskEventSelect extends TasksEvent {
  final int index;
  TaskEventSelect(this.index);
}

class TaskEventAdd extends TasksEvent {}


class TasksBloc extends Bloc<TasksEvent, List<Task>> {
  TasksBloc(List<Task> initialState) : super(initialState);

  @override
  Stream<List<Task>> mapEventToState(TasksEvent event) async* {
    if (event is TaskEventSelect) {
      state.elementAt(event.index).isSelected = true;
      yield List.from(state);
    }

    if(event is TaskEventAdd) {
      state.add(new Task("Задание номер ${state.length + 1}", false, DateTime.now()));
      yield List.from(state);
    }
  }
}
