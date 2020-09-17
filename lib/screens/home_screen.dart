import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaskmanager/bloc/counter_block.dart';
import 'package:fluttertaskmanager/components/task.dart';
import 'package:fluttertaskmanager/models/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<Task> tasks = [
  Task("Купить хлеб, 1 батон", false, DateTime.now()),
  Task("Забрать ребенка из садика", false, DateTime.now()),
  Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
  Task("Сверстать сайт из взятого заказа", false, DateTime.now()),
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterBloc(0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (_, index) => TaskWidget(
                  task: tasks[index],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, int>(
                  builder: (BuildContext context, int count) {
                    return Text("Выбрано: $count заданий", style: TextStyle(fontSize: 24),);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    size: 40,
                    color: Colors.blue[500],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
