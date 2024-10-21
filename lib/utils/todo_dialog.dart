import 'package:flutter/material.dart';

class TodoDialog extends StatefulWidget {
  final TextEditingController todoController;
  final VoidCallback addTodo;
  const TodoDialog(
      {super.key, required this.todoController, required this.addTodo});

  @override
  State<TodoDialog> createState() => _TodoDialogState();
}

class _TodoDialogState extends State<TodoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        "Add Todo",
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
      content: TextField(
        controller: widget.todoController,
        decoration: const InputDecoration(
            hintText: "Enter Todo", hintStyle: TextStyle(color: Colors.blue)),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.addTodo();
            Navigator.pop(context);
          },
          child: const Text(
            "Add",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
