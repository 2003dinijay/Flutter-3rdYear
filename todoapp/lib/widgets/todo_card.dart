import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  final String title;
  final bool isDone;
  final Function onTap;
  final Function delete;

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
        color: Colors.deepPurple,
      ),

      child: ListTile(
        onTap: () => widget.onTap(),
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
