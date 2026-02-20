import 'package:flutter/material.dart';
import 'package:todoapp/widgets/todo_card.dart';
import 'package:todoapp/widgets/search_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearch(String value) {
    print("Searching for: $value");
    // Add your search logic here
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBarInput(
                textEditingController: _searchController,
                searchData: _onSearch,
              ),
              const SizedBox(height: 20),
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
      ),
    );
  }
}
