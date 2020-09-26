import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaskmanager/bloc/tasks_bloc.dart';
import 'package:fluttertaskmanager/models/task.dart';
import 'package:fluttertaskmanager/screens/home_screen.dart';

class TaskEditScreen extends StatelessWidget {
  final int id;
  final String defaultText;

  const TaskEditScreen({Key key, this.id, this.defaultText}) : super(key: key);


  void save(context, tasksBloc, text) {
    String finalText = text != null ? text : defaultText;
    tasksBloc.add(new TaskEventChangeText(id, finalText));
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    String finalText;
    final tasksBloc = BlocProvider.of<TasksBloc>(context);

    return (new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: Text("Редактирование"),
          backgroundColor: Colors.green[500],
        ),
        body: BlocBuilder<TasksBloc, List<Task>>(
          builder: (context, List<Task> tasks) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: TextField(
                            controller: TextEditingController(
                              text: tasks[id].text,
                            ),
                            onChanged: (value) => {finalText = value},
                            maxLines: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.save, color: Colors.blue[400]),
                        iconSize: 90,
                        onPressed: () => save(context, tasksBloc, finalText),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        )));
  }
}
