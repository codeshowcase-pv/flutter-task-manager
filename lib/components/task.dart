import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaskmanager/bloc/counter_block.dart';
import 'package:fluttertaskmanager/models/task.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key key, @required this.task}) : super(key: key);

  final Task task;

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    print("initState");
  }

  void markSelected(_counterBloc) {
    print('press');

    setState(() {
      isSelected = !isSelected;
    });

    if (isSelected) {
      _counterBloc.add(CounterEvents.increment);
    }
    else {
      _counterBloc.add(CounterEvents.decrement);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Card(
      color: isSelected ? Colors.blue[700] : Colors.blue[400],
      shadowColor: Colors.grey[500],
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      elevation: 5,
      child: ListTile(
        enabled: true,
        title: Text(widget.task.text,
            maxLines: 1,
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center),
        subtitle: Text(widget.task.text,
            style: TextStyle(fontSize: 14, color: Colors.grey[300]),
            textAlign: TextAlign.center),
        leading: IconButton(
          disabledColor: Colors.grey[400],
          icon: Icon(
            Icons.check,
            size: 40,
            color: isSelected ? Colors.white : Colors.grey[400],
          ),
          onPressed: () => markSelected(_counterBloc),
        ),
      ),
    );
  }
}
