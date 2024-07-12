import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todostudy/components/my_drawer.dart';
import 'package:todostudy/pages/form_page.dart';
import 'package:todostudy/store/tasklist.store.dart';

class TaskListPage extends StatefulWidget {
  TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    final taskStore = Provider.of<TaskListStore>(context);
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_task),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const FormPage()))
              .then((value) => setState(() {}));
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          const Text("Task List Page"),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 232, 232, 232),
            ),
            child: ListView.builder(
                itemCount: taskStore.taskList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(taskStore.taskList[index].title),
                      leading: Text(
                        (index+1).toString(),
                        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)), 
                    ),
                  );
                }),
          )),
        ]),
      ),
    );
  }
}
