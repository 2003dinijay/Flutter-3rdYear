import 'package:flutter/material.dart';
import 'package:todoapp/widgets/todo_card.dart';
import 'package:todoapp/widgets/search_bar.dart';
import 'package:todoapp/models/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _todoController = TextEditingController();
  List<Todo> _todoList = [Todo(id: '1', title: 'GYM')];

  void _onSearch(String value) {
    print("Searching for: $value");
    // Add your search logic here
  }

  void _toggleTodo(String id) {
    setState(() {
      final todo = _todoList.firstWhere((todo) => todo.id == id);
      todo.toggleDone();
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      _todoList.removeWhere((todo) => todo.id == id);
    });
  }

  void _addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Todo'),
          content: TextField(
            controller: _todoController,
            decoration: const InputDecoration(hintText: 'Enter todo title'),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _todoController.clear();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_todoController.text.isNotEmpty) {
                  setState(() {
                    _todoList.add(
                      Todo(
                        id: DateTime.now().toString(),
                        title: _todoController.text,
                      ),
                    );
                  });
                  _todoController.clear();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _todoController.dispose();
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
              Expanded(
                child: ListView.builder(
                  itemCount: _todoList.length,
                  itemBuilder: (context, index) {
                    final todo = _todoList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TodoCard(
                        title: todo.title,
                        isDone: todo.isDone,
                        onTap: () => _toggleTodo(todo.id),
                        delete: () => _deleteTodo(todo.id),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
