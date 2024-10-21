import 'package:flutter/material.dart';

class TodoListTile extends StatefulWidget {
  final Map<String, dynamic> todo;
  final VoidCallback deleteTodo;
  final ValueChanged<bool?> toggleComplete;

  const TodoListTile(
      {super.key,
      required this.todo,
      required this.deleteTodo,
      required this.toggleComplete});

  @override
  State<TodoListTile> createState() => _TodoListTileState();
}

class _TodoListTileState extends State<TodoListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          widget.todo["title"],
          style: TextStyle(
              decoration: widget.todo["isCompleted"]
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        tileColor: Colors.blue,
        textColor: Colors.black,
        trailing: IconButton(
            onPressed: () {
              widget.deleteTodo();
            },
            icon: const Icon(Icons.delete)),
        leading: Checkbox(
            value: widget.todo["isCompleted"],
            onChanged: (bool? value) {
              widget.toggleComplete(value);
            }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
