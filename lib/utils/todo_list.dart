import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_dialog.dart';
import 'package:todo_app/utils/todo_list_tile.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // final List Todos = [
  final List<Map<String, dynamic>> _todos = [];
  final TextEditingController _todoController = TextEditingController();
  void _openDilaog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return TodoDialog(todoController: _todoController, addTodo: _addTodo);
        });
  }

  String _generateId() {
    return Random().nextInt(2000).toString();
  }

  void _addTodo() {
    setState(() {
      _todos.add({
        "id": _generateId(),
        "title": _todoController.text,
        "isCompleted": false
      });
      _todoController.clear();
    });
  }

  void _toggleCompletion(int index, bool? value) {
    setState(() {
      _todos[index]["isCompleted"] = !_todos[index]["isCompleted"];
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: _todos.isEmpty
          ? const Center(
              child: Text(
                "No todos, Add one",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemBuilder: (item, index) {
                final todo = _todos[index];
                return TodoListTile(
                    todo: todo,
                    deleteTodo: () => _deleteTodo(index),
                    toggleComplete: (value) => _toggleCompletion(index, value));
              },
              itemCount: _todos.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openDilaog,
        child: const Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}
