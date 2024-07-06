import 'package:flutter/material.dart';
import 'package:todostudy/components/my_drawer.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: const Center(child: Text("Task List Page"),),
    );
  }
}