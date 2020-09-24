import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaskmanager/bloc/tasks_bloc.dart';
import 'package:fluttertaskmanager/screens/home_screen.dart';

import 'models/task.dart';

class TaskManagerApp extends StatelessWidget{

  final List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context )=> TasksBloc(_tasks),
      child: MaterialApp(
        title: "Task manager",
        home: HomeScreen(),
      ),
    );
  }
}