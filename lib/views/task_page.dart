import 'package:flutter/material.dart';
import 'package:timer/models/task.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<Task> _tasks = [
    Task(title: 'Task 1', duration: const Duration(minutes: 30)),
    Task(title: 'Task 2', duration: const Duration(minutes: 60)),
    Task(title: 'Task 3', duration: const Duration(minutes: 90)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text('${task.duration.inMinutes} minutes'),
            trailing: Checkbox(
              value: task.completed,
              onChanged: (value) {
                setState(() {
                  task.completed = value!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
