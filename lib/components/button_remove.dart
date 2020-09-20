import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaskmanager/bloc/tasks_bloc.dart';

class ButtonRemoveWidget extends StatelessWidget {

  final taskId;

  ButtonRemoveWidget(this.taskId);

  @override
  Widget build(BuildContext context) {

    final _tasksBloc = BlocProvider.of<TasksBloc>(context);

    return (
        IconButton(
          icon: Icon(
              Icons.remove,
              size: 40,
              color: Colors.white
          ),
          onPressed: () => {_tasksBloc.add(TaskEventRemove(taskId))},
        )
    );
  }

}