import 'package:flutter/material.dart';
import 'package:fluttertaskmanager/screens/home_screen.dart';

class TaskManagerApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task manager",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Text("Task manager",),
        ),
        body: HomeScreen(),
      ),
    );
  }
}