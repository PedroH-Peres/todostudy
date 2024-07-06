import 'package:flutter/material.dart';
import 'package:todostudy/components/my_drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                color: const Color.fromARGB(255, 207, 205, 205),
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
                          width: MediaQuery.of(context).size.width * 1.8 / 3,
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
              const SizedBox(height: 10,),
              const Text(
                "Today",
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                "Activities",
                style: TextStyle(fontSize: 16),
              ),
              Expanded(
                  child: Container(
                color: Colors.cyanAccent,
              )),
            ],
          ),
        ));
  }
}
