import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaskmanager/bloc/counter_block.dart';
import 'package:fluttertaskmanager/bloc/tasks_bloc.dart';

class ButtonAddWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final _tasksBloc = BlocProvider.of<TasksBloc>(context);

    return (
        FlatButton.icon(
          //padding: EdgeInsets.symmetric(vertical: 15),
          icon: Icon(
            Icons.add_circle,
            size: 48,
            color: Colors.blue[500],
          ),
          onPressed: () => {_tasksBloc.add(TaskEventAdd())} ,
          label: Text(''),
        )
    );
  }

}
