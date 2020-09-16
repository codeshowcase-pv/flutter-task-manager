import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaskmanager/models/task.dart';

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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (_, index) => Card(
                color: Colors.blue[500],
                shadowColor: Colors.grey[500],
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                elevation: 5,
                child: ListTile(
                  title: Text(tasks[index].text, maxLines: 1,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center),
                  subtitle: Text(tasks[index].text,
                      style: TextStyle(fontSize: 14, color: Colors.grey[300]),
                      textAlign: TextAlign.center),
                  leading: IconButton(
                    disabledColor: Colors.grey[400],
                    icon: Icon(
                      Icons.error_outline,
                      size: 40,
                    ),
                    onPressed: () => {print("tap")},
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add_circle, size: 40, color: Colors.blue[500],),
          )
        ],
      ),
    );
  }
}
