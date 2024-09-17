import 'package:flutter/material.dart';
import 'package:todostudy/components/my_drawer.dart';
import 'package:todostudy/models/task.dart';

class TaskPage extends StatelessWidget {
  Task task;
  
  TaskPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          Text(task.getTitle),
          Text(task.repetition),
          Text(task.isCompleted ? "Completed" : "Incomplete")
        ],),
      ),
    );
  }
}