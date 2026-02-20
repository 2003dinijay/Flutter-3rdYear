class Todo {
  final String id;
  final String title;
  bool isDone = false;

  Todo({required this.id, required this.title});

  void toggleDone() {
    isDone = !isDone;
  }
}
