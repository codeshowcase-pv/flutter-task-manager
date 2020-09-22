import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaskmanager/bloc/tasks_bloc.dart';

class ButtonRemoveSelectedWidget extends StatelessWidget {

  final bool isVisible;

  const ButtonRemoveSelectedWidget({Key key, this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // ignore: close_sinks
    final taskBloc = BlocProvider.of<TasksBloc>(context);

    return Visibility(
      visible: isVisible,
      child: (
          FlatButton.icon(
              onPressed: () => {
                taskBloc.add(TaskEventRemoveSelected())
              },
              icon: Icon(
                Icons.block,
                color: Colors.red[500],
                size: 40,
              ),
              label: Text(''))
      ),
    );
  }

}