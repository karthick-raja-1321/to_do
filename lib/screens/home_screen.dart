import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Todo> _todos = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo(String title) {
    if (title.isEmpty) return;
    setState(() {
      _todos.add(Todo(title: title));
      _controller.clear();
    });
  }

  void _toggleTodoStatus(int index) {
    setState(() {
      _todos[index].toggleDone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To-Do List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24, // 🔸 Increased title font size
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(
                          color: Colors.white, // 🔸 Text inside TextField is white
                          fontSize: 18,         // 🔸 Increased font size
                        ),
                        decoration: const InputDecoration(
                          labelText: 'New task',
                          labelStyle: TextStyle(
                            color: Colors.white, // 🔸 Label text is white
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: Colors.black54,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () => _addTodo(_controller.text),
                    )
                  ],
                ),
              ),
              Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  final todo = _todos[index];
                  return ListTile(
                    tileColor: Colors.black.withOpacity(0.4),
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        color: Colors.white, // ✅ White font color
                        fontSize: 18,         // ✅ Increased font size
                        decoration: todo.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    trailing: Checkbox(
                      value: todo.isDone,
                      onChanged: (_) => _toggleTodoStatus(index),
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                    ),
                  );
                },
              ),
            ),

            ],
          )
        ],
      ),
    );
  }
}
