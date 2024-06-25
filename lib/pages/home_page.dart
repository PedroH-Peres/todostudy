import 'package:flutter/material.dart';
import 'package:todostudy/components/myDrawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do & Study", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Text("Today", style: TextStyle(fontSize: 20),),
            Container(color: Colors.cyanAccent, height: 35,),
            const Text("Activities", style: TextStyle(fontSize: 16),),
            Expanded(child: Container(color: Colors.cyanAccent,)),
             
          ],
        ),
      )
    );
  }
}