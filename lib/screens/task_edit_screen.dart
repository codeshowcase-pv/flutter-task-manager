import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaskmanager/bloc/tasks_bloc.dart';
import 'package:fluttertaskmanager/models/task.dart';

class TaskEditScreen extends StatelessWidget {
  final int id;
  final String text;

  const TaskEditScreen({Key key, this.id, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text;

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
                            onChanged: (text) => {print(text)},
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
