import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaskmanager/bloc/tasks_bloc.dart';
import 'package:fluttertaskmanager/components/button_add.dart';
import 'package:fluttertaskmanager/components/button_remove_selected.dart';
import 'package:fluttertaskmanager/components/task.dart';
import 'package:fluttertaskmanager/models/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Ваши заметки"),
        backgroundColor: Colors.green[500],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<TasksBloc, List<Task>>(
                builder: (context, List<Task> tasks) {
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  itemBuilder: (_, index) =>
                      TaskWidget(task: tasks[index], taskId: index),
                ),
              );
            }),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<TasksBloc, List<Task>>(
                    builder: (context, List<Task> tasks) {
                      return Text(
                        "Всего: ${tasks.length}",
                        style: TextStyle(fontSize: 24),
                      );
                    },
                  ),
                  ButtonAddWidget(),
                  BlocBuilder<TasksBloc, List<Task>>(
                    builder: (context, List<Task> tasks) {
                      return ButtonRemoveSelectedWidget(
                          isVisible: tasks
                                  .where((element) => element.isSelected)
                                  .toList()
                                  .length >
                              0);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
