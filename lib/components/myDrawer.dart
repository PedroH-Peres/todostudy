import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todostudy/pages/home_page.dart';
import 'package:todostudy/pages/taskList_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Text("Todo Study"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const Homepage()));
              },
              child: const Text("Home"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const TaskListPage()));
              },
              child: const Text("Task List"),
            ),
          ],
        ),
      ),
    );
  }
}
