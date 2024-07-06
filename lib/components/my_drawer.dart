import 'package:flutter/material.dart';
import 'package:todostudy/pages/home_page.dart';
import 'package:todostudy/pages/tasklist_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Color(0xFFF7A9F9)),
                child: Text(
              "Todo Study",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
            ListTile(
              shape: const Border(
                  bottom: BorderSide(color: Colors.grey),
                  top: BorderSide(color: Colors.grey)),
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const Homepage())),
            ),
            ListTile(
              shape: const Border(bottom: BorderSide(color: Colors.grey)),
              title: const Text("Task List"),
              leading: const Icon(Icons.list),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const TaskListPage())),
            )
          ],
        ),
      ),
    );
  }
}
