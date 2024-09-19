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
      body: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text(
                            task.getTitle,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Text(task.repetition),
                        ]),
                      )),
                ),
              ],
            ),
            const Divider(),
            Row(children: [
              Expanded(
                child: Card(
                    elevation: 2,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                textAlign: TextAlign.center,
                                "Description",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              task.description,
                            )
                          ],
                        ))),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Card(
                      elevation: 2,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            children: [
                              const Text(
                                "Status",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                task.isCompleted ? "Completed" : "Incomplete",
                                style: TextStyle(
                                    color: task.isCompleted
                                        ? Colors.green
                                        : Colors.redAccent),
                              )
                            ],
                          ))),
                ),
                Expanded(
                  child: Card(
                      elevation: 2,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            children: [
                              const Text(
                                "Completions",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text(task.completionQtt.toString())
                            ],
                          ))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
