import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:todostudy/components/my_drawer.dart';
import 'package:todostudy/models/task.dart';
import 'package:todostudy/pages/task_page.dart';
import 'package:todostudy/store/tasklist.store.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final taskStore = Provider.of<TaskListStore>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "To-do & Study",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFFF7A9F9),
          iconTheme: const IconThemeData(color: Colors.white),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        drawer: const MyDrawer(),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 16, left: 10, right: 10),
          child: Column(
            children: [
              Card(
                color: const Color.fromARGB(255, 232, 232, 232),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Today's Tasks: "),
                          Container(
                            height: 12,
                            width: MediaQuery.of(context).size.width * 1.6 / 3,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          const Text(" 0%")
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Today",
                style: TextStyle(fontSize: 12),
              ),
              const Text(
                "Activities",
                style: TextStyle(fontSize: 16),
              ),
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
                      Task task = taskStore.taskList[index];
                      return Card(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => TaskPage(task: task)));
                          },
                          child: ListTile(
                            title: Text(task.title),
                            trailing: Text(task.isCompleted ? "Completed" : "Incomplete", style: TextStyle(fontSize: 16, color: task.isCompleted ? Colors.green : Colors.grey, fontWeight: task.isCompleted ? FontWeight.bold: FontWeight.normal ),),
                            leading: IconButton(
                              iconSize: 30,
                              onPressed: (){
                              setState(() {
                                final now = DateTime.now();
                                DateTime dateOnly = DateTime(now.year, now.month, now.day);
                                task.markCompleteButton(dateOnly);
                              });
                            }, icon: Icon(task.isCompletedToday() ? Icons.check_circle_rounded:Icons.check_circle_outline, color: task.isCompletedToday() ? Colors.green: Colors.grey,),),
                            subtitleTextStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                            
                            subtitle: Text(task.repetition),
                          ),
                        ),
                      );
                    }),
              )),
            ],
          ),
        ));
  }
}
