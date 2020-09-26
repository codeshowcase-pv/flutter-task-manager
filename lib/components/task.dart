import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaskmanager/bloc/tasks_bloc.dart';
import 'package:fluttertaskmanager/components/button_remove.dart';
import 'package:fluttertaskmanager/models/task.dart';
import 'package:fluttertaskmanager/screens/task_edit_screen.dart';

class TaskWidget extends StatelessWidget {

  final Task task;
  final int taskId;

  TaskWidget({this.task, this.taskId});

  void markSelected(_tasksBloc){
    _tasksBloc.add(TaskEventSelect(taskId));
  }

  void editTask(context){
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new TaskEditScreen(id: taskId, defaultText: task.text,)));
  }

  @override
  Widget build(BuildContext context) {
    final _tasksBloc = BlocProvider.of<TasksBloc>(context);

    return Card(
      color: task.isSelected ? Colors.blue[700] : Colors.blue[400],
      shadowColor: Colors.grey[500],
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      elevation: 5,
      child: ListTile(
        enabled: true,
        onTap: () => {
          editTask(context)
        },
        title: Text(task.text,
            maxLines: 1,
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center),
        subtitle: Text(task.text,
            style: TextStyle(fontSize: 14, color: Colors.grey[300]),
            textAlign: TextAlign.center),
        leading: IconButton(
          disabledColor: Colors.grey[400],
          icon: Icon(
            Icons.check,
            size: 40,
            color: task.isSelected ? Colors.white : Colors.grey[400],
          ),
          onPressed: () => markSelected(_tasksBloc),
        ),
        trailing: ButtonRemoveWidget(taskId)
      ),
    );
  }
}




// class TaskWidget extends StatefulWidget {
//   const TaskWidget({Key key, @required this.task, this.id}) : super(key: key);
//
//   final Task task;
//   final int id;
//
//   @override
//   _TaskWidgetState createState() => _TaskWidgetState(task, id);
// }
//
// class _TaskWidgetState extends State<TaskWidget> {
//   @override
//   void initState() {
//     super.initState();
//     print("initState");
//   }
//
//   final Task task;
//   final int id;
//
//   _TaskWidgetState(this.task, this.id);
//
//   void markSelected(_tasksBloc) {
//     _tasksBloc.add(TaskEventSelect(id));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final _tasksBloc = BlocProvider.of<TasksBloc>(context);
//
//     return Card(
//       color: false ? Colors.blue[700] : Colors.blue[400],
//       shadowColor: Colors.grey[500],
//       margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//       elevation: 5,
//       child: ListTile(
//         enabled: true,
//         title: Text(widget.task.text,
//             maxLines: 1,
//             style: TextStyle(fontSize: 20, color: Colors.white),
//             textAlign: TextAlign.center),
//         subtitle: Text(widget.task.text,
//             style: TextStyle(fontSize: 14, color: Colors.grey[300]),
//             textAlign: TextAlign.center),
//         leading: IconButton(
//           disabledColor: Colors.grey[400],
//           icon: Icon(
//             Icons.check,
//             size: 40,
//             color: false ? Colors.white : Colors.grey[400],
//           ),
//           onPressed: () => markSelected(_tasksBloc),
//         ),
//       ),
//     );
//   }
// }
