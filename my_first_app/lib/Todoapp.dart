
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login_screen.dart';


class Todoapp extends StatelessWidget {
  const Todoapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController taskController = TextEditingController();

  List<String> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  // Read saved tasks
  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();

    String? savedData = prefs.getString('tasks');

    if (savedData != null) {
      List<dynamic> decodedData = jsonDecode(savedData);

      if (!mounted) return;

      setState(() {
        tasks = decodedData.cast<String>();
      });
    }
  }

  // Save tasks
  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('tasks', jsonEncode(tasks));
  }

  // Add task
  void addTask() {
    if (taskController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      tasks.add(taskController.text.trim());
      taskController.clear();
    });

    saveTasks();
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });

    saveTasks();
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13042E),

      appBar: AppBar(
        title: const Text('My Todo App'),
        backgroundColor: const Color(0xFF30037C),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: taskController,
              style: const TextStyle(color: Colors.white),

              decoration: const InputDecoration(
                hintText: 'Enter your task',
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),
      ElevatedButton(
  onPressed: () {
    Navigator.pop(context);
  },
  child: Text("Go Back"),
),
ElevatedButton(
  onPressed: () {
    Navigator.popUntil(
      context,
    (route) => route.isFirst,
    );
  },
  child: const Text('Go to Login'),
),
            ElevatedButton(
           
              onPressed: addTask,
              
              child: const Text('Add Task'),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,

                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(tasks[index]),

                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),

                        onPressed: () {
                          deleteTask(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
