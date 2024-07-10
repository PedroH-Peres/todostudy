import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todostudy/pages/home_page.dart';
import 'package:todostudy/store/tasklist.store.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TaskListStore>(create: (_)=>TaskListStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-do & Study',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Homepage(),
      ),
    );
  }
}
