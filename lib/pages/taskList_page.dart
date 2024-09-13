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
      appBar: AppBar(
          title: const Text(
            "Task List",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF7A9F9),
        child: const Icon(Icons.add_task),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const FormPage()))
              .then((value) => setState(() {}));
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          const Text(
            "Week Tasks",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(child: const Text("Weekday: All"),),
          const SizedBox(height: 10,),
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
                        (index + 1).toString(),
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(context: context, builder: (_)=>Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                width: 350,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  const Text("Tem certeza que deseja remover esta tarefa?"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    TextButton(onPressed: (){
                                      setState(() {taskStore.removeTaskbyIndex(index); Navigator.of(context).pop();});
                                    }, child: const Text("Yes")),
                                    const SizedBox(width: 10,),
                                    TextButton(onPressed: (){
                                      Navigator.of(context).pop();
                                    }, child: const Text("No")),
                                  ],)
                                ],),
                              ),
                            ));
                          }, icon: const Icon(Icons.delete)),
                    ),
                  );
                }),
          )),
        ]),
      ),
    );
  }
}
