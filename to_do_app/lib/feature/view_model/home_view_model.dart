import 'package:flutter/foundation.dart';
import 'package:to_do_app/product/database/hive/core/hive_database_manager.dart';

class Task {
  int? id;
  String title;
  String description;

  Task({this.id, required this.title, required this.description});
}

class HomeViewModel extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  HomeViewModel() {
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    final data = HiveDatabaseManager().fetchTasks();
    _tasks = data
        .map((task) => Task(
              id: task['id'],
              title: task['title'],
              description: task['description'],
            ))
        .toList();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await HiveDatabaseManager().insertTask({
      'title': task.title,
      'description': task.description,
    });
    fetchTasks();
  }

  Future<void> updateTask(Task task) async {
    await HiveDatabaseManager().updateTask({
      'id': task.id,
      'title': task.title,
      'description': task.description,
    });
    fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await HiveDatabaseManager().deleteTask(id);
    fetchTasks();
  }
}
