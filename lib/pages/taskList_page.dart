import 'package:flutter/material.dart';
import 'package:todostudy/components/my_drawer.dart';
import 'package:todostudy/pages/form_page.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(children: [
          const Text("Task List Page"),
          TextButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const FormPage()));
            },
            child: const Text("Create"),
          )
        ]),
      ),
    );
  }
}
