import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertaskmanager/models/task.dart';

abstract class TasksEvent {}

class TaskEventSelect extends TasksEvent {
  final int index;
  TaskEventSelect(this.index);
}

class TaskEventAdd extends TasksEvent {}

class TaskEventRemove extends TasksEvent {
  final int index;
  TaskEventRemove(this.index);
}

class TaskEventRemoveSelected extends TasksEvent {}


class TasksBloc extends Bloc<TasksEvent, List<Task>> {
  TasksBloc(List<Task> initialState) : super(initialState);

  @override
  Stream<List<Task>> mapEventToState(TasksEvent event) async* {
    if (event is TaskEventSelect) {
      state.elementAt(event.index).isSelected = !state.elementAt(event.index).isSelected;
      yield List.from(state);
    }

    if(event is TaskEventAdd) {
      state.add(new Task("Задание номер ${state.length + 1}", false, DateTime.now()));
      yield List.from(state);
    }

    if(event is TaskEventRemove) {
      state.removeAt(event.index);
      yield List.from(state);
    }

    if(event is TaskEventRemoveSelected) {
      state.removeWhere((element) => element.isSelected);
      yield List.from(state);
    }
  }
}
