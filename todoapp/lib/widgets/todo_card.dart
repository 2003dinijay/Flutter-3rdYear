import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  String title;
  bool isDone;
  Function onTap;
  Function delete;

  TodoCard({
    super.key,
    required this.title,
    required this.isDone,
    required this.onTap,
    required this.delete,
  });

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),

      child: ListTile(
        leading: widget.isDone
            ? Icon(Icons.check_box, color: Colors.green)
            : Icon(Icons.circle_outlined, color: Colors.white),
        trailing: IconButton(
          onPressed: () => widget.delete(),
          icon: Icon(Icons.delete, color: Colors.red),
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
