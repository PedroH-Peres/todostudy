import 'package:flutter/material.dart';

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


  @override
  Widget build(BuildContext context) {
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
            Form(
              key: _formKey,
                child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 0.5, color: Colors.grey))
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  maxLines: 5,
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    label: Text("Description"),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 0.5, color: Colors.grey))
                  ),
                ),
                Row(children: [
                  Text("Timer: "),
                  Checkbox(value: isChecked, onChanged: (v){
                  setState(() {
                    isChecked = v ??false;
                    print(isChecked);
                  });
                })
                ],)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
