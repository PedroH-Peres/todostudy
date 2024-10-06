import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todostudy/models/task.dart';
import 'package:todostudy/store/tasklist.store.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool isChecked = false;

  final days = ["SEG", "TER", "QUA", "QUI", "SEX", "SAB", "DOM"];
  List<String> repetition = [];

  @override
  Widget build(BuildContext context) {
    final taskStore = Provider.of<TaskListStore>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Text(
              "New Task",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                        label: Text("Title"),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.5, color: Colors.grey))),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    maxLines: 6,
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                        label: Text("Description"),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.5, color: Colors.grey))),
                  ),
                  const SizedBox(height: 12,),
                  Row(children: [
                    const Text("Week Days: "),
                    for (int i = 0; i < 7; i++)
                      TextButton(
                        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(repetition.contains(days[i]) ?Colors.deepPurple : Colors.white)),
                        onPressed: () {
                          setState(() {
                            if (repetition.contains(days[i])) {
                              repetition.remove(days[i]);
                            } else {
                              repetition.add(days[i]);
                            }
                          });
                        },
                        child: Text(
                          days[i],
                          style: TextStyle(
                              color: repetition.contains(days[i])
                                  ? Colors.white
                                  : Colors.deepPurple,
                              fontWeight: repetition.contains(days[i])
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      )
                  ]),
                  const SizedBox(height: 22,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Timer: "),
                      Checkbox(
                          value: isChecked,
                          onChanged: (v) {
                            setState(() {
                              isChecked = v ?? false;
                            });
                          })
                    ],
                  ),
                  if(isChecked)
                    const Text("00:00", style: TextStyle(fontSize: 32),),
                ],
              ),
            ),
            const SizedBox(height: 25,),
            TextButton(
                onPressed: () {
                  for(var item in repetition){
                    taskStore.addTask(
                      Task(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        timer: isChecked,
                        repetition: item),
                    );
                  }
                  Navigator.of(context).pop();
                },
                child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}
