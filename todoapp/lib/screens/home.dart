import 'package:flutter/material.dart';
import 'package:todoapp/widgets/todo_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Icon(Icons.menu), Icon(Icons.person)],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TodoCard(
              title: "GYM",
              isDone: false,
              onTap: () {
                print("Tapped on GYM");
              },
              delete: () {
                print("Deleted");
              },
            ),
          ],
        ),
      ),
    );
  }
}
