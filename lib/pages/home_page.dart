import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:todostudy/components/my_drawer.dart';
import 'package:todostudy/models/task.dart';
import 'package:todostudy/store/tasklist.store.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

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
        drawer: MyDrawer(),
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
                      //Pensar na verificação se a task foi completa no dia ou nao
                      return Card(
                        child: ListTile(
                          title: Text(task.title),
                          leading: IconButton(onPressed: (){}, icon: Icon(Icons.check_circle_outline, color: Colors.grey,)),
                          subtitleTextStyle: TextStyle(fontSize: 12, color: Colors.grey),
                          subtitle: Row(children: [
                            for(int i = 0; i < task.repetition.length; i++)
                              Text("${task.repetition[i]}  "),

                          ],),
                        ),
                      );
                    }),
              )),
            ],
          ),
        ));
  }
}
