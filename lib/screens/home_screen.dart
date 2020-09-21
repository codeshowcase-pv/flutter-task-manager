import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaskmanager/bloc/counter_block.dart';
import 'package:fluttertaskmanager/bloc/tasks_bloc.dart';
import 'package:fluttertaskmanager/components/button_add.dart';
import 'package:fluttertaskmanager/components/task.dart';
import 'package:fluttertaskmanager/models/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<Task> _tasks = [
  // Task("Купить хлеб, 1 батон", true, DateTime.now()),
  // Task("Забрать ребенка из садика", false, DateTime.now()),
  // Task("Сверстать сайт из взятого заказа", true, DateTime.now()),
  // Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  // Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  // Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  // Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  // Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  // Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  // Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  // Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  // Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  // Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(_tasks),
      child: BlocProvider(
        create: (context) => CounterBloc(0),
        child: Container(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
